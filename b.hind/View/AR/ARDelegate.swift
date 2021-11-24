//
//  ARDelegate.swift
//  b.hind
//
//  Created by Sthefanny Gonzaga on 24/11/21.
//

import Foundation
import ARKit
import UIKit
import RealityKit

class ARDelegate: NSObject, ARSCNViewDelegate, ObservableObject {
    @Published var message:String = "starting AR"
    
    let soundAnchor = SCNNode()
    let monsterAnchor = AnchorEntity()
    var soundTimer: Timer? = nil
    var monsterTimer: Timer? = nil
    var soundAnchorIsPlaying = false
    
    func setARView(_ arView: ARSCNView) {
        self.arView = arView
        
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = .horizontal
        arView.session.run(configuration)
        
        arView.delegate = self
        arView.scene = SCNScene()
        
        showSoundForRandomTimes(uiView: uiView)
        
//        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapOnARView))
//        arView.addGestureRecognizer(tapGesture)
//
//        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panOnARView))
//        arView.addGestureRecognizer(panGesture)
    }
    
    public func castSpell() {
        message = "spell Casted"
    }
    
    @objc func panOnARView(sender: UIPanGestureRecognizer) {
        guard let arView = arView else { return }
        let location = sender.location(in: arView)
        switch sender.state {
        case .began:
            if let node = nodeAtLocation(location) {
                trackedNode = node
            }
        case .changed:
            if let node = trackedNode {
                if let result = raycastResult(fromLocation: location) {
                    moveNode(node, raycastResult:result)
                }
            }
        default:
            ()
        }
        
    }
    
    @objc func tapOnARView(sender: UITapGestureRecognizer) {
        guard let arView = arView else { return }
        let location = sender.location(in: arView)
        if let node = nodeAtLocation(location) {
            removeCircle(node: node)
        }
        else if let result = raycastResult(fromLocation: location) {
            addCircle(raycastResult: result)
        }
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
    }
    
    // MARK: - Private
    
    private var arView: ARSCNView?
    private var circles:[SCNNode] = []
    private var trackedNode:SCNNode?
    
    
    private func addCircle(raycastResult: ARRaycastResult) {
        let circleNode = GeometryUtils.createCircle(fromRaycastResult: raycastResult)
        if circles.count >= 2 {
            for circle in circles {
                circle.removeFromParentNode()
            }
            circles.removeAll()
        }
        
        arView?.scene.rootNode.addChildNode(circleNode)
        circles.append(circleNode)
        
        nodesUpdated()
    }
    
    
    
    private func moveNode(_ node:SCNNode, raycastResult:ARRaycastResult) {
        node.simdWorldTransform = raycastResult.worldTransform
        nodesUpdated()
    }
    
    private func nodeAtLocation(_ location:CGPoint) -> SCNNode? {
        guard let arView = arView else { return nil }
        let result = arView.hitTest(location, options: nil)
        return result.first?.node
    }
    
    private func nodesUpdated() {
        if circles.count == 2 {
            let distance = GeometryUtils.calculateDistance(firstNode: circles[0], secondNode: circles[1])
            print("distance = \(distance)")
            message = "distance " + String(format: "%.2f cm", distance)
        }
        else {
            message = "add second point"
        }
    }
    
    private func raycastResult(fromLocation location: CGPoint) -> ARRaycastResult? {
        guard let arView = arView,
              let query = arView.raycastQuery(from: location,
                                              allowing: .existingPlaneGeometry,
                                              alignment: .horizontal) else { return nil }
        let results = arView.session.raycast(query)
        return results.first
    }
    
    func removeCircle(node:SCNNode) {
        node.removeFromParentNode()
        circles.removeAll(where: { $0 == node })
    }
    
    func showSoundForRandomTimes() {
        let quantityToShow = Int.random(in: 3..<6)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            var counter = 1
            
            self.soundTimer = Timer.scheduledTimer(withTimeInterval: 6, repeats: true) { timer in
                if self.soundAnchorIsPlaying == false {
                    if counter < quantityToShow {
                        self.showEmptyAnchor(uiView: uiView)
                        counter += 1
                    }
                    else {
                        self.showMonster(uiView: uiView)
                    }
                }
            }
        }
    }
    
    func showEmptyAnchor() {
        let randomPositionX = Float.random(in: -2..<2)
        let randomPositionY = Float.random(in: -2..<2)
        let randomPositionZ = Float.random(in: -2..<2)
        
        soundAnchor.position = SCNVector3(randomPositionX, randomPositionY, randomPositionZ)
        
        attachSoundToEmptyAnchor()
        
        soundAnchorIsPlaying = true
        
        arView?.scene.rootNode.addChildNode(soundAnchor)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.removeEmptyAnchor(uiView: uiView)
        }
    }
    
    func attachSoundToEmptyAnchor() {
        do {
            let resource = try AudioFileResource.load(named: "growl.mp3", in: nil, inputMode: .spatial, loadingStrategy: .preload, shouldLoop: false)
            
            //            let audioController = soundAnchor.prepareAudio(resource)
            //            audioController.play()
            
            // If you want to start playing right away, you can replace lines 7-8 with line 11 below
            var player = SCNAudioPlayer()
            player
            soundAnchor.addAudioPlayer(SCNAudioPlayer)
            soundAnchor.playAudio(resource)
        } catch {
            print("Error loading audio file")
        }
    }
    
    func removeEmptyAnchor() {
        soundAnchor.removeFromParentNode()
        soundAnchorIsPlaying = false
    }
    
    func showMonster(uiView: ARView) {
        let randomPositionX = Float.random(in: -2..<2)
        let randomPositionY = Float.random(in: -2..<2)
        
        let modelEntity = try! ModelEntity.loadModel(named: "Monster.usdz")
        
        var zPosition: Float = -2
        
        monsterAnchor.position = SIMD3(0, 0, zPosition)
        monsterAnchor.transform.rotation = simd_quatf(ix: 0, iy: 1, iz: 0, r: 0)
        monsterAnchor.addChild(modelEntity.clone(recursive: true))
        
        attachSoundToMonster()
        
        
        uiView.scene.addAnchor(monsterAnchor)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.monsterTimer = Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { timer in
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
            
            // If you want to start playing right away, you can replace lines 7-8 with line 11 below
            // let audioController = entity.playAudio(resource)
        } catch {
            print("Error loading audio file")
        }
    }
}
