//
//  ARDelegate.swift
//  b.hind
//
//  Created by Sthefanny Gonzaga on 24/11/21.
//

import Foundation
import ARKit
import RealityKit

class ARDelegate: NSObject, ARSessionDelegate, ObservableObject {
    @Published var message:String = "starting AR"
    @Published var userLives:Int = 3
    @Published var monsterLives:Int = 3
    
    
    
    // MARK: - Private
    
    private var arView: ARView?
    private var circles:[SCNNode] = []
    private var trackedNode:SCNNode?
    
    let soundAnchor = AnchorEntity()
    let monsterAnchor = AnchorEntity()
    var soundTimer: Timer? = nil
    var monsterTimer: Timer? = nil
    var soundAnchorIsPlaying = false
    var cameraPosition: SIMD3<Float>?
    
    func setARView(_ arView: ARView) {
        self.arView = arView
        
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = .horizontal
        arView.session.run(configuration)
        
        arView.session.delegate = self
        
//        showSoundForRandomTimes()
        showMonster()
    }
    
    func session(_ session: ARSession, didUpdate frame: ARFrame) {
        let distance = DistanceUtils.calculateDistance(first: monsterAnchor.position, second: cameraPosition)
            print("distance = \(distance)")
        if distance <= 10 {
            message = "Morreu pelo session"
        }
    }
    
    public func castSpell() {
        message = "spell Casted"
        
        let distance = DistanceUtils.calculateDistance(first: monsterAnchor.position, second: cameraPosition)
            print("distance = \(distance)")
        if distance >= 10 {
            message = "Matou"
        } else {
            message = "Morreu"
        }
    }
    
    public func exit() {
        soundAnchor.stopAllAudio()
        monsterAnchor.stopAllAudio()
        soundTimer?.invalidate()
        monsterTimer?.invalidate()
        arView!.scene.anchors.removeAll()
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
        
        soundAnchor.position = SIMD3(randomPositionX, randomPositionY, randomPositionZ)
        
        attachSoundToEmptyAnchor()
        
        soundAnchorIsPlaying = true
        
        arView?.scene.addAnchor(soundAnchor)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.removeEmptyAnchor()
        }
    }
    
    func play(_ name: String, source: SCNAudioSource, node: SCNNode) {
        let _ = ARAudioPlayer(name: name, source: source, node: node)
    }
    
    func attachSoundToEmptyAnchor() {
        do {
            let resource = try AudioFileResource.load(named: "growl.mp3", in: nil, inputMode: .spatial, loadingStrategy: .preload, shouldLoop: false)
            
            let audioController = soundAnchor.prepareAudio(resource)
            audioController.play()
        } catch {
            print("Error loading audio file")
        }
    }
    
    func removeEmptyAnchor() {
        arView?.scene.removeAnchor(soundAnchor)
        soundAnchorIsPlaying = false
    }
    
    func showMonster() {
        let randomPositionX = Float.random(in: -2..<2)
        let randomPositionY = Float.random(in: -2..<2)
        
        let modelEntity = try! ModelEntity.loadModel(named: "Monster.usdz")
        
        var zPosition: Float = -2
        
        monsterAnchor.position = SIMD3(0, 0, zPosition)
        monsterAnchor.transform.rotation = simd_quatf(ix: 0, iy: 1, iz: 0, r: 0)
        monsterAnchor.addChild(modelEntity.clone(recursive: true))
        
        attachSoundToMonster()
        
        arView?.scene.addAnchor(monsterAnchor)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { timer in
                self.monsterTimer = timer
                zPosition = zPosition + 0.1
                self.monsterAnchor.position = SIMD3(0, 0, zPosition)
                
                if zPosition >= 0 {
                    timer.invalidate()
                }
            }
        }
    }
    
    func attachSoundToMonster() {
        do {
            let resource = try AudioFileResource.load(named: "growl.mp3", in: nil, inputMode: .spatial, loadingStrategy: .preload, shouldLoop: false)
            
            let audioController = monsterAnchor.prepareAudio(resource)
            audioController.play()
        } catch {
            print("Error loading audio file")
        }
    }
}
