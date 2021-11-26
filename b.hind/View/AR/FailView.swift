//
//  FailView.swift
//  b.hind
//
//  Created by Sthefanny Gonzaga on 25/11/21.
//

import SwiftUI

struct FailView : View {
    var body: some View {
        return NavigationView {
            ZStack {
//                Color.black.edgesIgnoringSafeArea(.all)
                
                GeometryReader { geo in
                    
                    Text("Fail")
                        .padding(.top, 100)
                }
                .edgesIgnoringSafeArea(.all)
            }
        }
    }
}

struct FailView_Previews : PreviewProvider {
    static var previews: some View {
        FailView()
    }
}
