//
// Created by Sthefanny Gonzaga on 22/11/21.
//

import SwiftUI

class HomeViewDismisser: ObservableObject {
    @Published var isActive: Bool = false
}

struct HomeView : View {
    @EnvironmentObject var dismisser: HomeViewDismisser
    let size = UIScreen.main.bounds.size
    @State private var showConfirm = false
    @State private var showTutorial = false
    
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
        .navigationBarHidden(true)
        .onAppear {
            UserRepository().setShowOnboardingInfo(showOnboarding: true)
            let tutorialAlreadyShown = TutorialRepository().getShowTutorial()
            showTutorial = tutorialAlreadyShown == false
            
            AnalyticsService().setView(name: HomeView.self)
        }
        .alert("Ooops.. this is not ready yet... \n er... I mean... You don't have access to this right now.", isPresented: $showConfirm) {
            Button("OK", role: .cancel) { }
        }
    }
    
    var buildSettings: some View {
        Button(action: {
            showConfirm = true
        }) {
            Image("settings_icon")
                .frame(width: size.width, alignment: .trailing)
                .padding(.top, 50)
                .padding(.bottom, 20)
                .padding(.trailing, 40)
        }
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
    
    func buildIcon(image: String, text: String) -> some View {
        Button(action: {
            showConfirm = true
        }) {
            VStack (alignment: .center) {
                Image(image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: size.width * 0.1, height: size.height * 0.1, alignment: .center)
                
                Text(text)
                    .font(.system(size:12))
                    .foregroundColor(.white)
            }
        }
    }
    
    var buildBgoodApp: some View {
        buildIcon(image: "achievements_icon", text: "B.Good")
    }
    
    var buildBOnTimeApp: some View {
        buildIcon(image: "time_icon", text: "B.On Time")
    }
    
    var buildBGrimApp: some View {
        buildIcon(image: "grim_icon", text: "B.Grim")
    }
    
    var buildBBankApp: some View {
        buildIcon(image: "bank_icon", text: "B.Bank")
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
            NavigationLink(destination: MessageView()) {
                Image("message_icon")
                    .resizable()
                    .scaledToFill()
                    .frame(width: size.width * 0.1, height: size.height * 0.1, alignment: .trailing)
                    .padding(.top, 10)
                    .padding(.bottom, 5)
            }
            NavigationLink(destination: CallView()) {
                Image("phone_icon")
                    .resizable()
                    .scaledToFill()
                    .frame(width: size.width * 0.1, height: size.height * 0.1, alignment: .center)
                    .padding(.top, 10)
                    .padding(.leading, 45)
                    .padding(.trailing, 45)
                    .padding(.bottom, 5)
            }
            NavigationLink(destination: MailView(), isActive: $dismisser.isActive) {
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
