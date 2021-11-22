//
//  ContentView.swift
//  b.hind
//
//  Created by Sthefanny Gonzaga on 10/11/21.
//

import SwiftUI
import RealityKit

struct MonsterView : View {
    @State private var animationAmount = 2.0
    
    var body: some View {
        return ZStack {
            ARViewRepresentable().edgesIgnoringSafeArea(.all)
            
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
                
                Image("ar_power_button")
                    .padding(.bottom, geo.size.height * 0.03)
                    .frame(width: geo.size.width, height: geo.size.height, alignment: .bottom)
                    .onTapGesture {
                        animationAmount = 1
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                            animationAmount = 2
                        }
                    }
                
                Image("ar_full_life")
                    .padding(.bottom, geo.size.height * 0.2)
                    .frame(width: geo.size.width, height: geo.size.height, alignment: .bottom)
                
                Image("ar_leave_button")
                    .padding(.top, geo.size.height * 0.13)
                    .padding(.leading, geo.size.height * 0.04)
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
    }
}


#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        MonsterView()
    }
}
#endif
