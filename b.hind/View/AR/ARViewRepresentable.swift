//
//  ARViewRepresentable.swift
//  b.hind
//
//  Created by Sthefanny Gonzaga on 12/11/21.
//

import SwiftUI
import RealityKit
import ARKit

struct ARViewRepresentable: UIViewRepresentable {
    
    // MARK: - Properties
    
    // MARK: - UIViewRepresentable
    func makeUIView(context: Context) -> ARView {
        CustomARView(frame: .zero)
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {
        
        let modelEntity = try! ModelEntity.loadModel(named: "Monster.usdz")
        
        var firstPosition: Float = -2
        
        let anchorEntity = AnchorEntity()
        anchorEntity.position = SIMD3(0, 0, firstPosition)
        anchorEntity.transform.rotation = simd_quatf(ix: 0, iy: 1, iz: 0, r: 0)
        anchorEntity.addChild(modelEntity .clone(recursive: true))
        
        do {
          let resource = try AudioFileResource.load(named: "growl.mp3", in: nil, inputMode: .spatial, loadingStrategy: .preload, shouldLoop: true)
          
          let audioController = anchorEntity.prepareAudio(resource)
          audioController.play()
         
          // If you want to start playing right away, you can replace lines 7-8 with line 11 below
          // let audioController = entity.playAudio(resource)
        } catch {
          print("Error loading audio file")
        }
        
        uiView.scene.addAnchor(anchorEntity)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { timer in
                firstPosition = firstPosition + 0.1
                anchorEntity.position = SIMD3(0, 0, firstPosition)
                
                if firstPosition >= 0 {
                    timer.invalidate()
                }
            }
        }
    }
}
