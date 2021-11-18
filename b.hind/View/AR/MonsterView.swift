//
//  ContentView.swift
//  b.hind
//
//  Created by Sthefanny Gonzaga on 10/11/21.
//

import SwiftUI
import RealityKit

struct MonsterView : View {
    var body: some View {
        return ARViewRepresentable().edgesIgnoringSafeArea(.all)
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        MonsterView()
    }
}
#endif
