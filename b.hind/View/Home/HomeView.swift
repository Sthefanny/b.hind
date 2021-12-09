//
// Created by Sthefanny Gonzaga on 22/11/21.
//

import SwiftUI
import Firebase

struct HomeView : View {
    let size = UIScreen.main.bounds.size
    @State var showTutorial = false
    
    var body: some View {
        return ZStack {

            Color.black.edgesIgnoringSafeArea(.all)
            
            Image("home_bg")
                .resizable()
                .scaledToFill()
                .frame(width: size.width, height: size.height)
                .edgesIgnoringSafeArea(.all)
            
            VStack (alignment: .center) {
                buildSettings
                buildHint
                
                HStack (alignment: .top) {
                    Spacer()
                    VStack (alignment: .center)  {
                        buildBgoodApp
                        buildBBankApp
                    }
                    .frame(width: size.width * 0.3, alignment: .trailing)
                    
                    VStack (alignment: .center) {
                        HStack {
                            buildBOnTimeApp
                            
                            Spacer()
                            
                            buildBGrimApp
                            
                        }
                        buildWidgetApp
                        
                    }
                    .frame(width: size.width * 0.5, alignment: .leading)
                    .padding(.horizontal, 70)
                    
                    Spacer()
                    
                }
                .padding(.top, 20)
                .frame(width: size.width, alignment: .center)
                Spacer()
                
                buildBottomApps
            }
            .padding(.bottom, 30)
            .frame(width: size.width, height: size.height, alignment: .top)
            .edgesIgnoringSafeArea(.all)
            
            if showTutorial {
                TutorialView(showTutorial: $showTutorial)
            }
            
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarTitle("")
        .onAppear {
            
            UserRepository().setShowOnboardingInfo(showOnboarding: false)
            showTutorial = UserRepository().getShowOnboardingInfo()
            Analytics.logEvent(AnalyticsEventScreenView,
                           parameters: [AnalyticsParameterScreenName: "\(HomeView.self)",
                                        AnalyticsParameterScreenClass: "\(HomeView.self)"])
            
        }
        
    }
    
    var buildSettings: some View {
        Image("settings_icon")
            .frame(width: size.width, alignment: .trailing)
            .padding(.top, 50)
            .padding(.bottom, 20)
            .padding(.trailing, 40)
    }
    
    var buildHint: some View {
        VStack (alignment: .leading) {
            HStack {
                Text("B.hint")
                    .font(.system(size: 17, weight: .semibold))
                    .foregroundColor(Color("home_title"))
                    .padding(.bottom, 2)
                    .padding(.top, 10)
                
                Spacer()
                
                Image("hint_logo")
            }
            
            Text("Use earphones for a better experience with our spatial audio, we are not responsible for occasional heart attacks or the voices in your head.")
                .font(.system(size: 15, weight: .regular))
                .foregroundColor(.white)
                .padding(.bottom, 2)
        }
        .padding(.horizontal, 25)
        .frame(width: size.width * 0.9, height: size.height * 0.16, alignment: .center)
        .background(Color("home_hint_bg").opacity(0.72))
        .clipShape(RoundedRectangle(cornerRadius: 25))
        .background(
            RoundedRectangle(cornerRadius: 25)
                .stroke(Color("home_hint_bg").opacity(0.72), lineWidth: 1)
        )
    }
    
    var buildBgoodApp: some View {
        VStack (alignment: .center) {
            Image("achievements_icon")
                .resizable()
                .scaledToFill()
                .frame(width: size.width * 0.1, height: size.height * 0.1, alignment: .center)
            
            Text("B.Good")
                .font(.system(size:12))
                .foregroundColor(.white)
        }
    }
    
    var buildBOnTimeApp: some View {
        VStack (alignment: .center) {
            Image("time_icon")
                .resizable()
                .scaledToFill()
                .frame(width: size.width * 0.1, height: size.height * 0.1, alignment: .center)
            
            Text("B.On Time")
                .font(.system(size:12))
                .foregroundColor(.white)
        }
    }
    
    var buildBGrimApp: some View {
        VStack (alignment: .center) {
            Image("grim_icon")
                .resizable()
                .scaledToFill()
                .frame(width: size.width * 0.1, height: size.height * 0.1, alignment: .center)
            
            Text("B.Grim")
                .font(.system(size:12))
                .foregroundColor(.white)
        }
    }
    
    var buildBBankApp: some View {
        VStack (alignment: .center) {
            Image("bank_icon")
                .resizable()
                .scaledToFill()
                .frame(width: size.width * 0.1, height: size.height * 0.1, alignment: .center)
                .padding(.top, 10)
            
            Text("B.Bank")
                .font(.system(size:12))
                .foregroundColor(.white)
        }
    }
    
    var buildWidgetApp: some View {
        Image("widget_1")
            .resizable()
            .scaledToFill()
            .frame(width: size.width * 0.3, height: size.height * 0.3)
            .padding(.top, 10)
    }
    
    var buildBottomApps: some View {
        HStack {
            NavigationLink(destination: MailView()) {
                Image("message_icon")
                    .resizable()
                    .scaledToFill()
                    .frame(width: size.width * 0.1, height: size.height * 0.1, alignment: .trailing)
                    .padding(.top, 10)
                    .padding(.bottom, 5)
            }
            NavigationLink(destination: MailView()) {
                Image("phone_icon")
                    .resizable()
                    .scaledToFill()
                    .frame(width: size.width * 0.1, height: size.height * 0.1, alignment: .center)
                    .padding(.top, 10)
                    .padding(.leading, 45)
                    .padding(.trailing, 45)
                    .padding(.bottom, 5)
            }
            NavigationLink(destination: MailView()) {
                Image("mail_icon")
                    .resizable()
                    .scaledToFill()
                    .frame(width: size.width * 0.1, height: size.height * 0.1, alignment: .leading)
                    .padding(.top, 10)
                    .padding(.bottom, 5)
            }
            
            
        }
        .frame(width: size.width * 0.9, height: size.height * 0.12, alignment: .center)
        .background(Color("home_bottom_group").opacity(0.6))
        .clipShape(RoundedRectangle(cornerRadius: 32))
        .background(
            RoundedRectangle(cornerRadius: 32)
                .stroke(Color("home_bottom_group").opacity(0.6), lineWidth: 1)
        )
    }
}

struct HomeView_Previews : PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
