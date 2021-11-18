//
//  Call.swift
//  b.hind
//
//  Created by HANNA P C FERREIRA on 18/11/21.
//

import Foundation
import SwiftUI

struct PreviewCallView: View {
    
    @Environment(\.verticalSizeClass) var heightSizeClass: UserInterfaceSizeClass?
    
    @Environment(\.horizontalSizeClass) var widthSizeClass: UserInterfaceSizeClass?
    
    var body: some View {
        if heightSizeClass == .regular {
            ZStack (alignment: .center) {
                Image("bg-blur")
                    .resizable()
                    .ignoresSafeArea()
                    //.edgesIgnoringSafeArea(.all)
            }
        }
        else if heightSizeClass == .compact{
            Text("Paisagem")
                .padding()
        }
        else{
            Text("Sei lá")
                .padding()
        }
    }
}

struct PreviewCallView_Previews: PreviewProvider {
    static var previews: some View {
        PreviewCallView()
//.previewInterfaceOrientation(.portrait)
//            .previewLayout(.device)
//            .previewInterfaceOrientation(.portrait)
    }
}
