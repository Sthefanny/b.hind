//
//  warningView.swift
//  b.hind
//
//  Created by HANNA P C FERREIRA on 24/11/21.
//

import SwiftUI
import Firebase

struct WarningView: View {
    @StateObject var dismisser = HomeViewDismisser()
    @State var showOnBoarding = false
    @State var showHome = false
    let userRepository = UserRepository()
    
    var body: some View {
        
        NavigationView {

            ZStack{
                Color.black
                    .ignoresSafeArea()
                VStack (alignment: .center){
                    Text("WARNING")
                        .foregroundColor(.white)
                        .font(.custom("JosefinSans-Bold", size: 34))
                        .padding()
                    
                    Text("This game contains loud noises,\njumpsacres and mature language.\n\nPlayer discretion is advised.")
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .font(.custom("JosefinSans-Regular", size: 18))
                
                    Spacer()
                    
                    Image("audio")
                        .frame(width: 108, height: 108, alignment: .center)
                    
                    Text("best played with headphones")
                        .foregroundColor(.white)
                        .font(.custom("JosefinSans-Regular", size: 18))
                        .padding(.top, 40)
                    
                    Text("Remember to turn your device's volume on")
                        .foregroundColor(.white)
                        .font(.custom("JosefinSans-Regular", size: 18))
                        .padding(.top, 10)
                    
                    Spacer()
                    
                    Text("Click anywhere to continue")
                        .foregroundColor(.white)
                        .font(.custom("JosefinSans-Regular", size: 18))
                        .padding(.top, 10)
                    
                }
                
                Button(action: {
                    let showOnboarding = userRepository.getShowOnboardingInfo()
                    
                    if showOnboarding {
                        showOnBoarding = true
                    } else {
                        showHome = true
                    }
                }) {
                    Rectangle()
                        .foregroundColor(Color.black.opacity(0.01))
                        .navigationBarBackButtonHidden(true)
                        .ignoresSafeArea()
                }
                
                NavigationLink("", destination: CallingView(), isActive: $showOnBoarding)
                NavigationLink("", destination: HomeView(), isActive: $showHome)
            }
            .navigationBarBackButtonHidden(true)
        } //navigationview
        .onAppear() {
//            userRepository.setShowOnboardingInfo(showOnboarding: true)
            
//            Analytics.logEvent(AnalyticsEventScreenView,
//                           parameters: [AnalyticsParameterScreenName: "\(WarningView.self)",
//                                        AnalyticsParameterScreenClass: "\(WarningView.self)"])
        }
        .environmentObject(dismisser)
        .navigationBarBackButtonHidden(true)
        .navigationBarTitle("")
        .navigationViewStyle(.stack)
        
    }
}

struct warningView_Previews: PreviewProvider {
    static var previews: some View {
        WarningView()
    }
}
