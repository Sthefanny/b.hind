//
//  ContentView.swift
//  b.hind
//
//  Created by Sthefanny Gonzaga on 10/11/21.
//

import SwiftUI
import RealityKit
import ARKit

let soundAnchor = AnchorEntity()
let monsterAnchor = AnchorEntity()
var arView: ARView? = nil
var soundTimer: Timer? = nil
var monsterTimer: Timer? = nil


struct MonsterView : View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
//    @ObservedObject var arDelegate = ARDelegate()
    @State private var animationAmount = 2.0
    @State private var active = true
    //    UIViewControllerRepresentable
    //    VIewModel com binds Observable Object e observed Object
    // Raycast para matar o bicho
    
    var body: some View {
        return ZStack {
//            ARViewRepresentable(arDelegate: arDelegate)
//            VStack {
//                Spacer()
//                Text(arDelegate.message)
//                    .foregroundColor(Color.primary)
//                    .frame(maxWidth: .infinity)
//                    .padding(.bottom, 20)
//                    .background(Color.secondary)
//            }
            
            GeometryReader { geo in
                Image("ar_bg")
                    .resizable()
                    .scaledToFill()
                    .frame(width: geo.size.width, height: geo.size.height)
                
                Image("ar_top")
                    .frame(width: geo.size.width, alignment: .center)
                
                Image("ar_left")
                    .frame(width: geo.size.width, height: geo.size.height, alignment: .leading)
                
                Image("ar_right")
                    .frame(width: geo.size.width, height: geo.size.height, alignment: .trailing)
                
                Image("ar_full_life")
                    .padding(.bottom, geo.size.height * 0.2)
                    .frame(width: geo.size.width, height: geo.size.height, alignment: .bottom)
                
                VStack {
                    Button(action: {
                        print("ar_leave_button")
//                        ARViewContainer().exit()
                        self.mode.wrappedValue.dismiss()
                    }) {
                        Image("ar_leave_button")
                    }
                    .padding(.top, geo.size.height * 0.12)
                    .padding(.bottom, geo.size.height * 0.12)
                    .frame(width: geo.size.width * 0.15, height: geo.size.height * 0.07, alignment: .topLeading)
                    
                    Spacer()
                    
//                    Text(arDelegate.message)
//                        .foregroundColor(.red)
//                        .foregroundColor(Color.primary)
//                        .background(Color.secondary)
//                        .frame(width: geo.size.width * 0.3, alignment: .center)
                    
                    Button(action: {
                        print("ar_power_button")
//                        ARViewContainer().chekIfSpellHitMonster()
//                        arDelegate.castSpell()
                        animationAmount = 1
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                            animationAmount = 2
                        }
                    }) {
                        Image("ar_power_button")
                    }
                    .padding(.leading, geo.size.width * 0.7)
                    .frame(width: geo.size.width * 0.3, height: geo.size.height * 0.12, alignment: .center)
                    .padding(.bottom, geo.size.height * 0.03)
                }
                .frame(width: geo.size.width, height: geo.size.height, alignment: .topLeading)
                
                
                Rectangle()
                    .frame(width: geo.size.width, height: geo.size.height, alignment: .topLeading)
                    .foregroundColor(.white)
                    .aspectRatio(1.0, contentMode: .fit)
                    .scaleEffect(animationAmount)
                    .opacity(2 - animationAmount)
                    .animation(
                        .easeInOut(duration: 0.2)
                            .repeatCount(1, autoreverses: false),
                        value: animationAmount
                    )
                
                
            }
            .edgesIgnoringSafeArea(.all)
        }
        .edgesIgnoringSafeArea(.all)
        .navigationBarBackButtonHidden(true)
    }
}



//struct ARViewContainer: UIViewRepresentable {
//
//    // MARK: - Properties
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
////        showSoundForRandomTimes(uiView: uiView)
//                showMonster(uiView: uiView)
//    }
//
//    func raycasting(model: AnchorEntity) {
//
//        let startPosition: SIMD3<Float> = model.position
//        let endPosition: SIMD3<Float> = [0, 0, 0]
//        let query: CollisionCastQueryType = .all
//        let mask: CollisionGroup = .all
//
//        let raycasts: [CollisionCastHit] = arView!.scene.raycast(from: startPosition,
//                                                                  to: endPosition,
//                                                               query: query,
//                                                                mask: mask,
//                                                          relativeTo: nil)
//
//        guard let rayCast: CollisionCastHit = raycasts.first
//        else { return }
//
//        print(rayCast.distance)      /* The distance from the ray origin to the hit */
//        print(rayCast.entity.name)   /* The entity's name that was hit              */
//
////        guard let query = arView?.makeRaycastQuery(from: arView!.center,
////                                                   allowing: .estimatedPlane,
////                                                   alignment: .horizontal)
////        else { return }
////
////        guard let result = arView?.session.raycast(query).first
////        else { return }
////
////        let raycastAnchor = AnchorEntity(raycastResult: result)
////        raycastAnchor.addChild(model)
////        arView?.scene.anchors.append(raycastAnchor)
//    }
//
//    func chekIfSpellHitMonster() {
//        raycasting(model: monsterAnchor)
//    }
//
//    func session(_ session: ARSession, didUpdate frame: ARFrame) {
//        let cameraTransform = frame.camera.transform
//        let cameraPosition = SCNVector3(
//            /* At this moment you could be sure, that camera properly oriented in world coordinates */
//            cameraTransform.columns.3.x,
//            cameraTransform.columns.3.y,
//            cameraTransform.columns.3.z
//        )
//        /* Now you have cameraPosition with x,y,z coordinates and you can calculate distance between those to points */
//        let randomPoint = CGPoint(
//            /* Here you can make random point for hitTest. */
//            x: CGFloat(monsterAnchor.position.x),
//            y: CGFloat(monsterAnchor.position.y)
//        )
//        guard let testResult = frame.hitTest(randomPoint, types: .featurePoint).first else { return }
//        let objectPoint = SCNVector3(
//            /* Converting 4x4 matrix into x,y,z point */
//            testResult.worldTransform.columns.3.x,
//            testResult.worldTransform.columns.3.y,
//            testResult.worldTransform.columns.3.z
//        )
//        /* do whatever you need with this object point */
//        print("testResult = \(testResult)")
//        print("objectPoint = \(objectPoint)")
//    }
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
//        monsterAnchor.position = SIMD3(0, 0, zPosition)
//        monsterAnchor.transform.rotation = simd_quatf(ix: 0, iy: 1, iz: 0, r: 0)
//        monsterAnchor.addChild(modelEntity.clone(recursive: true))
//
//        attachSoundToMonster()
//
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
//
//}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        MonsterView()
    }
}
#endif
