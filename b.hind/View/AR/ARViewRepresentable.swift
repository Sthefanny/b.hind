//
//  ARViewRepresentable.swift
//  b.hind
//
//  Created by Sthefanny Gonzaga on 12/11/21.
//

import ARKit
import SwiftUI

struct ARViewRepresentable: UIViewRepresentable {
    let arDelegate:ARDelegate
    
    func makeUIView(context: Context) -> some UIView {
        let arView = ARSCNView(frame: .zero)
        arDelegate.setARView(arView)
        return arView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}

struct ARViewRepresentable_Previews: PreviewProvider {
    static var previews: some View {
        ARViewRepresentable(arDelegate: ARDelegate())
    }
}




//
//import SwiftUI
//import RealityKit
//import ARKit
//
//struct ARViewRepresentable: UIViewRepresentable {
//    
//    // MARK: - Properties
//    @State var soundAnchor = AnchorEntity()
//    @State var monsterAnchor = AnchorEntity()
//    @State var arView: ARView? = nil
//    @State var soundTimer: Timer? = nil
//    @State var monsterTimer: Timer? = nil
//    @State var soundAnchorIsPlaying = false
//    
//    // MARK: - UIViewRepresentable
//    func makeUIView(context: Context) -> ARView {
//        CustomARView(frame: .zero)
//    }
//    
//    func updateUIView(_ uiView: ARView, context: Context) {
//        arView = uiView
//        
//        showSoundForRandomTimes(uiView: uiView)
//        //        showMonster(uiView: uiView)
//    }
//    
//    //    func session(_ session: ARSession, didUpdate frame: ARFrame) {
//    //        guard let cameraTransform = session.currentFrame?.camera.transform else { return }
//    //        let cameraPosition = SCNVector3(
//    //            /* At this moment you could be sure, that camera properly oriented in world coordinates */
//    //            cameraTransform.columns.3.x,
//    //            cameraTransform.columns.3.y,
//    //            cameraTransform.columns.3.z
//    //        )
//    //        /* Now you have cameraPosition with x,y,z coordinates and you can calculate distance between those to points */
//    //        let randomPoint = CGPoint(
//    //            /* Here you can make random point for hitTest. */
//    //            x: CGFloat(arc4random()) / CGFloat(UInt32.max),
//    //            y: CGFloat(arc4random()) / CGFloat(UInt32.max)
//    //        )
//    //        guard let testResult = frame.hitTest(randomPoint, types: .featurePoint).first else { return }
//    //        let objectPoint = SCNVector3(
//    //            /* Converting 4x4 matrix into x,y,z point */
//    //            testResult.worldTransform.columns.3.x,
//    //            testResult.worldTransform.columns.3.y,
//    //            testResult.worldTransform.columns.3.z
//    //        )
//    //        /* do whatever you need with this object point */
//    //    }
//    
//    func showSoundForRandomTimes(uiView: ARView) {
//        let quantityToShow = Int.random(in: 3..<6)
//        
//        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
//            var counter = 1
//            
//            soundTimer = Timer.scheduledTimer(withTimeInterval: 6, repeats: true) { timer in
//                if self.soundAnchorIsPlaying == false {
//                    if counter < quantityToShow {
//                        showEmptyAnchor(uiView: uiView)
//                        counter += 1
//                    }
//                    else {
//                        showMonster(uiView: uiView)
//                    }
//                }
//            }
//        }
//    }
//    
//    func showEmptyAnchor(uiView: ARView) {
//        let randomPositionX = Float.random(in: -2..<2)
//        let randomPositionY = Float.random(in: -2..<2)
//        let randomPositionZ = Float.random(in: -2..<2)
//        
//        soundAnchor.position = SIMD3(randomPositionX, randomPositionY, randomPositionZ)
//        
//        attachSoundToEmptyAnchor()
//        
//        soundAnchorIsPlaying = true
//        
//        uiView.scene.addAnchor(soundAnchor)
//        
//        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
//            removeEmptyAnchor(uiView: uiView)
//        }
//    }
//    
//    func attachSoundToEmptyAnchor() {
//        do {
//            let resource = try AudioFileResource.load(named: "growl.mp3", in: nil, inputMode: .spatial, loadingStrategy: .preload, shouldLoop: false)
//            
//            //            let audioController = soundAnchor.prepareAudio(resource)
//            //            audioController.play()
//            
//            // If you want to start playing right away, you can replace lines 7-8 with line 11 below
//            let audioController = soundAnchor.playAudio(resource)
//        } catch {
//            print("Error loading audio file")
//        }
//    }
//    
//    func removeEmptyAnchor(uiView: ARView) {
//        uiView.scene.removeAnchor(soundAnchor)
//        soundAnchorIsPlaying = false
//    }
//    
//    func showMonster(uiView: ARView) {
//        let randomPositionX = Float.random(in: -2..<2)
//        let randomPositionY = Float.random(in: -2..<2)
//        
//        let modelEntity = try! ModelEntity.loadModel(named: "Monster.usdz")
//        
//        var zPosition: Float = -2
//        
//        monsterAnchor.position = SIMD3(randomPositionX, randomPositionY, zPosition)
//        monsterAnchor.transform.rotation = simd_quatf(ix: 0, iy: 1, iz: 0, r: 0)
//        monsterAnchor.addChild(modelEntity.clone(recursive: true))
//        
//        attachSoundToMonster()
//        
//        uiView.scene.addAnchor(monsterAnchor)
//        
//        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
//            monsterTimer = Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { timer in
//                zPosition = zPosition + 0.1
//                monsterAnchor.position = SIMD3(0, 0, zPosition)
//                
//                if zPosition >= 0 {
//                    timer.invalidate()
//                }
//            }
//        }
//    }
//    
//    func attachSoundToMonster() {
//        do {
//            let resource = try AudioFileResource.load(named: "growl.mp3", in: nil, inputMode: .spatial, loadingStrategy: .preload, shouldLoop: false)
//            
//            let audioController = monsterAnchor.prepareAudio(resource)
//            audioController.play()
//            
//            // If you want to start playing right away, you can replace lines 7-8 with line 11 below
//            // let audioController = entity.playAudio(resource)
//        } catch {
//            print("Error loading audio file")
//        }
//    }
//    
//    func exit() {
//        soundAnchor.stopAllAudio()
//        monsterAnchor.stopAllAudio()
//        arView?.scene.anchors.removeAll()
//        arView?.session.pause()
//        arView?.removeFromSuperview()
//        arView = nil
//        soundTimer?.invalidate()
//    }
//}
