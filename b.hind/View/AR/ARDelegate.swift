//
//  ARDelegate.swift
//  b.hind
//
//  Created by Sthefanny Gonzaga on 24/11/21.
//

import Foundation
import ARKit
import RealityKit

enum cicleEnum {
    case running
    case restarting
    case monsterTakingDamage
}

class ARDelegate: NSObject, ARSessionDelegate, ObservableObject {
    @Published var message:String = "starting AR"
    @Published var userLife:Int = 3
    @Published var monsterLife:Int = 3
    @Published var cicleState:cicleEnum = .running
    @Published var isSuccess:Bool = false
    @Published var isFail:Bool = false
    @Published var lifeDamageAnimationAmount = 2.0
    
    
    
    // MARK: - Private
    
    private var arView: ARView?
    private var circles:[SCNNode] = []
    private var trackedNode:SCNNode?
    
    let configuration = ARWorldTrackingConfiguration()
    var soundAnchor: AnchorEntity? = nil
    var monsterAnchor: AnchorEntity? = nil
    var soundTimer: Timer? = nil
    var monsterTimer: Timer? = nil
    var soundAnchorIsPlaying = false
    var cameraPosition: SIMD3<Float>?
    
    func setARView(_ arView: ARView) {
        self.arView = arView
        
        configuration.planeDetection = .horizontal
        arView.session.run(configuration, options: [.resetTracking, .removeExistingAnchors])
        
        arView.session.delegate = self
        
        startCicle()
    }
    
    func session(_ session: ARSession, didUpdate frame: ARFrame) {
        if monsterAnchor != nil {
            let distance = DistanceUtils.calculateDistance(first: monsterAnchor!.position, second: cameraPosition)
            
            if distance <= 10 {
                takeUserLife()
            }
        }
    }
    
    public func castSpell() {
        if monsterAnchor != nil {
            message = "spell Casted"
            
            let distance = DistanceUtils.calculateDistance(first: monsterAnchor!.position, second: cameraPosition)
            if distance >= 10 && distance >= 50 {
                takeMonsterLife()
            } else {
                takeUserLife()
            }
        }
    }
    
    func takeUserLife() {
        if cicleState == .running && userLife > 0 {
            cicleState = .restarting
            self.lifeDamageAnimationAmount = 1
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                self.lifeDamageAnimationAmount = 2
            }
            userLife -= 1
            restartCicle()
            print("userLife = \(userLife)")
        } else if cicleState == .running && userLife == 0 {
            print("fail")
            exit()
            isSuccess = true
        }
    }
    
    func takeMonsterLife() {
        if cicleState == .running && monsterLife > 0 {
            cicleState = .monsterTakingDamage
            monsterLife -= 1
            restartCicle()
            print("monsterLife = \(monsterLife)")
        } else if cicleState == .running && monsterLife == 0 {
            print("success")
            exit()
            isSuccess = true
        }
    }
    
    func startCicle() {
    //        showSoundForRandomTimes()
        showMonster()
    }
    
    func restartCicle() {
        print("stopping")
        stopCicle()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                print("starting")
            self.startCicle()
        }
    }
    
    func stopCicle() {
        soundAnchor?.stopAllAudio()
        soundTimer?.invalidate()
        soundAnchor?.removeFromParent()
        soundAnchor = nil
        monsterAnchor?.stopAllAudio()
        monsterTimer?.invalidate()
        monsterAnchor?.removeFromParent()
        monsterAnchor = nil
        arView!.scene.anchors.removeAll()
    }
    
    public func exit() {
        stopCicle()
        arView!.session.pause()
        arView!.removeFromSuperview()
        arView = nil
    }
    
    func session(_ session: ARSession, cameraDidChangeTrackingState camera: ARCamera) {
        print("camera did change \(camera.trackingState)")
        switch camera.trackingState {
        case .limited(_):
            message = "tracking limited"
        case .normal:
            message =  "tracking ready"
        case .notAvailable:
            message = "cannot track"
        }
        
        let cameraTransform = camera.transform
        cameraPosition = SIMD3(
            cameraTransform.columns.3.x,
            cameraTransform.columns.3.y,
            cameraTransform.columns.3.z
        )
    }
    
//    private func raycastResult(fromLocation location: CGPoint) -> ARRaycastResult? {
//        guard let arView = arView,
//              let query = arView.makeRaycastQuery(from: location,
//                                                  allowing: .existingPlaneGeometry,
//                                                  alignment: .horizontal) else { return nil }
//        let results = arView.session.raycast(query)
//        return results.first
//    }
    
    func showSoundForRandomTimes() {
        let quantityToShow = Int.random(in: 3..<6)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            var counter = 1
            
            self.soundTimer = Timer.scheduledTimer(withTimeInterval: 6, repeats: true) { timer in
                if self.soundAnchorIsPlaying == false {
                    if counter < quantityToShow {
                        self.showEmptyAnchor()
                        counter += 1
                    }
                    else {
                        self.showMonster()
                    }
                }
            }
        }
    }
    
    func showEmptyAnchor() {
        let randomPositionX = Float.random(in: -2..<2)
        let randomPositionY = Float.random(in: -2..<2)
        let randomPositionZ = Float.random(in: -2..<2)
        
        soundAnchor = AnchorEntity()
        
        soundAnchor!.position = SIMD3(randomPositionX, randomPositionY, randomPositionZ)
        
        attachSoundToEmptyAnchor()
        
        soundAnchorIsPlaying = true
        
        arView?.scene.addAnchor(soundAnchor!)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.removeEmptyAnchor()
        }
    }
    
    func attachSoundToEmptyAnchor() {
        do {
            let resource = try AudioFileResource.load(named: "growl.mp3", in: nil, inputMode: .spatial, loadingStrategy: .preload, shouldLoop: false)
            
            let audioController = soundAnchor!.prepareAudio(resource)
            audioController.play()
        } catch {
            print("Error loading audio file")
        }
    }
    
    func removeEmptyAnchor() {
        arView?.scene.removeAnchor(soundAnchor!)
        soundAnchorIsPlaying = false
    }
    
    func showMonster() {
        let randomPositionX = Float.random(in: -2..<2)
        let randomPositionY = Float.random(in: -2..<2)
        
        let modelEntity = try! ModelEntity.loadModel(named: "Monster.usdz")
        
        var zPosition: Float = -2
        
        monsterAnchor = AnchorEntity()
        
        monsterAnchor!.position = SIMD3(0, 0, zPosition)
//        monsterAnchor.transform.rotation = simd_quatf(ix: 0, iy: 1, iz: 0, r: 0)
        monsterAnchor!.addChild(modelEntity.clone(recursive: true))
        
        attachSoundToMonster()
        
        arView?.scene.addAnchor(monsterAnchor!)
        
        cicleState = .running
        
//        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { timer in
                self.monsterTimer = timer
                zPosition = zPosition + 0.1
                self.monsterAnchor!.position = SIMD3(0, 0, zPosition)
                
                if zPosition >= 0 {
                    timer.invalidate()
                }
            }
//        }
    }
    
    func attachSoundToMonster() {
        do {
            let resource = try AudioFileResource.load(named: "growl.mp3", in: nil, inputMode: .spatial, loadingStrategy: .preload, shouldLoop: false)
            
            let audioController = monsterAnchor!.prepareAudio(resource)
            audioController.play()
        } catch {
            print("Error loading audio file")
        }
    }
}
