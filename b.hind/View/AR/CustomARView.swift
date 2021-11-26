//
//  CustomARView.swift
//  b.hind
//
//  Created by Sthefanny Gonzaga on 12/11/21.
//

import RealityKit
import ARKit

class CustomARView: ARView {
    
    // MARK: - Properties
    
    var arView: ARView? = nil
    
    // MARK: - Lifecycle
    required init(frame frameRect: CGRect) {
        super.init(frame: frameRect)
        setupARView()
    }
    
    required init?(coder decoder: NSCoder) {
        super.init(coder: decoder)
        setupARView()
    }
    
    public func exit() {
        arView?.__stopAudioEngine()
        arView?.scene.anchors.removeAll()
        arView?.removeFromSuperview()
        arView = nil
    }
}

// MARK: - Private
extension CustomARView: ARCoachingOverlayViewDelegate {
    
    func setupARView() {
        
        // Uncomment to user ".nonAR" camera.
        //useNonARCameraSample()
        let config = ARWorldTrackingConfiguration()
        config.planeDetection = [.horizontal, .vertical]
        config.environmentTexturing = .automatic
        if ARWorldTrackingConfiguration.supportsSceneReconstruction(.mesh) {
            config.sceneReconstruction = .mesh
        }
        
//        addCoaching()
        
        session.run(config, options: [.resetTracking, .removeExistingAnchors])
    }
    
    /// From: https://developer.apple.com/forums/thread/122229
    func useNonARCameraSample() {
        
        // RealityKit now adds and uses a default PerspectiveCamera.
        cameraMode = .nonAR
        
        // Provide your own PerspectiveCamera.
        // See: https://developer.apple.com/documentation/realitykit/perspectivecamera
        let cameraEntity = PerspectiveCamera()
        cameraEntity.camera.fieldOfViewInDegrees = 140
        let cameraAnchor = AnchorEntity(world: .one)
        cameraAnchor.addChild(cameraEntity)
        
        scene.addAnchor(cameraAnchor)
    }
    
    func addCoaching() {
        let coachingOverlay = ARCoachingOverlayView()
        coachingOverlay.delegate = self
        #if !targetEnvironment(simulator)
            coachingOverlay.session = self.session
        #endif
        coachingOverlay.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        coachingOverlay.activatesAutomatically = true
        coachingOverlay.goal = .horizontalPlane
        self.addSubview(coachingOverlay)
    }
    
    public func coachingOverlayViewDidDeactivate(_ coachingOverlayView: ARCoachingOverlayView) {
        print("did deactivate")
    }
}
