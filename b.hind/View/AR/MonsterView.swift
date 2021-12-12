//
//  ContentView.swift
//  b.hind
//
//  Created by Sthefanny Gonzaga on 10/11/21.
//

import SwiftUI
import RealityKit
import ARKit
import Firebase
import FirebaseAnalytics

struct MonsterView : View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @StateObject var arDelegate = ARDelegate()
    @State private var powerButtonAnimationAmount = 2.0
    
    var body: some View {
        return ZStack {
            ARViewRepresentable(arDelegate: arDelegate)
            
            GeometryReader { geo in
                Image("ar_filter")
                    .resizable()
                    .scaledToFill()
                    .frame(width: geo.size.width, height: geo.size.height)
                
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
                
                Image(getUserLife())
                    .padding(.bottom, geo.size.height * 0.2)
                    .frame(width: geo.size.width, height: geo.size.height, alignment: .bottom)
                
                VStack(alignment: .leading) {
                    Button(action: {
                        print("ar_leave_button")
                        arDelegate.exit()
                        self.mode.wrappedValue.dismiss()
                    }) {
                        Image("ar_leave_button")
                            .frame(width: geo.size.width * 0.15, height: geo.size.height * 0.07, alignment: .topLeading)
                    }
                    .padding(.leading, geo.size.height * 0.04)
                    .padding(.top, geo.size.height * 0.12)
                    
                    Spacer()
                    
//                    Text(arDelegate.message)
//                        .foregroundColor(.red)
//                        .foregroundColor(Color.primary)
//                        .background(Color.secondary)
//                        .frame(width: geo.size.width * 0.3, alignment: .center)
                    
                    Button(action: {
                        print("ar_power_button")
                        arDelegate.castSpell()
                        powerButtonAnimationAmount = 1
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                            powerButtonAnimationAmount = 2
                        }
                    }) {
                        Image("ar_power_button")
                    }
                    .frame(width: geo.size.width, height: geo.size.height * 0.12, alignment: .center)
                    .padding(.bottom, geo.size.height * 0.03)
                }
                .frame(width: geo.size.width, height: geo.size.height, alignment: .topLeading)
                
                
                Rectangle()
                    .frame(width: geo.size.width, height: geo.size.height, alignment: .topLeading)
                    .foregroundColor(.white)
                    .aspectRatio(1.0, contentMode: .fit)
                    .scaleEffect(powerButtonAnimationAmount)
                    .opacity(2 - powerButtonAnimationAmount)
                    .animation(
                        .easeInOut(duration: 0.2)
                            .repeatCount(1, autoreverses: false),
                        value: powerButtonAnimationAmount
                    )
                
                Rectangle()
                    .frame(width: geo.size.width, height: geo.size.height, alignment: .topLeading)
                    .foregroundColor(.red)
                    .aspectRatio(1.0, contentMode: .fit)
                    .scaleEffect(arDelegate.lifeDamageAnimationAmount)
                    .opacity(2 - arDelegate.lifeDamageAnimationAmount)
                    .animation(
                        .easeInOut(duration: 0.2)
                            .repeatCount(1, autoreverses: false),
                        value: arDelegate.lifeDamageAnimationAmount
                    )
                
                VStack {
                    NavigationLink(destination: CertificateOfAchievementView(), isActive: $arDelegate.isSuccess) {
                        EmptyView()
                    }
                
                    NavigationLink(destination: FailView(), isActive: $arDelegate.isFail) {
                        EmptyView()
                    }
                }
                
                
            }
            .edgesIgnoringSafeArea(.all)
        }
        .edgesIgnoringSafeArea(.all)
        .navigationBarHidden(true)
        .onAppear{
            Analytics.logEvent(AnalyticsEventScreenView,
                           parameters: [AnalyticsParameterScreenName: "\(MonsterView.self)",
                                        AnalyticsParameterScreenClass: "\(MonsterView.self)"])
        }
    }
    
    func getUserLife() -> String {
        switch arDelegate.userLife {
        case 3:
            return "ar_full_life"
        case 2:
            return "ar_two_life"
        case 1:
            return "ar_one_life"
        case 0:
            return "ar_empty_life"
        default:
            return "ar_full_life"
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
