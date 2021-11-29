//
//  ARViewRepresentable.swift
//  b.hind
//
//  Created by Sthefanny Gonzaga on 12/11/21.
//

import ARKit
import SwiftUI
import RealityKit

struct ARViewRepresentable: UIViewRepresentable {
    let arDelegate:ARDelegate

    func makeUIView(context: Context) -> some UIView {
        let arView = ARView(frame: .zero)
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
