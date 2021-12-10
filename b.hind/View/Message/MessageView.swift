//
//  MessageView.swift
//  b.hind
//
//  Created by Sthefanny Gonzaga on 10/12/21.
//

import SwiftUI
import Firebase

struct MessageView: View {
    let size = UIScreen.main.bounds.size
    
    let messageList = [
        "Hi, I'm Misty, recruiter and trainer at B.Witched, a company founded in 1430 by Joana Darc.",
        "B.Witched is pioneer in capturing supernatural beings and the best in the business of maintaining our plane of existence.",
        "I have a unique opportunity to offer you! We have an internship position available for our B.Hind team, and luckily (or not), we think your profile is perfect for the position.",
        "Enter 1 to accept this wonderful internship program.",
        "Enter 2 to reject the internship program and continue to be mediocre.",
        "You turned down the internship offer and decided to remain mediocre. Have a bad day.",
    ]
    
    private var messagesToShow = [Any]()
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            Image("home_bg")
                .resizable()
                .scaledToFill()
                .frame(width: size.width, height: size.height)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                _buildTop
                
                if messagesToShow.count > 0 {
                    ForEach(1..<messagesToShow.count) { index in
                        _buildMessages(text: messageList[index])
                    }
                }
                
                _buildButtons()
                
                _buildDeclineAnswer
                
                Spacer()
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarTitle("")
        .onAppear {
            UserRepository().setShowOnboardingInfo(showOnboarding: false)
            
            Analytics.logEvent(AnalyticsEventScreenView,
                           parameters: [AnalyticsParameterScreenName: "\(MessageView.self)",
                                        AnalyticsParameterScreenClass: "\(MessageView.self)"])
        }
    }
    
    func showContentByTime() -> Void {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            var counter = 1
            
            Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
                if messagesToShow.count <= messageList.count {
                    
                }
                else {
                    
                }
                
                
//                zPosition = zPosition + 0.1
//                self.monsterAnchor?.position = SIMD3(0, 0, zPosition)
//                
//                if zPosition >= 0 {
//                    timer.invalidate()
//                }
            }
        }
    }
    
    var _buildTop: some View {
        HStack {
            Image(systemName: "chevron.left")
                .font(.system(size: 20, weight: .regular))
                .foregroundColor(Color("message_icon_color"))
                .padding(20)
            
            Spacer()
            
            VStack {
                Image("misty_identified")
                Text("Misty - B.Witched")
                    .font(.custom("JosefinSans-Bold", size: 17))
                    .foregroundColor(.white)
            }
            
            Spacer()
            
            Image(systemName: "phone")
                .font(.system(size: 20, weight: .regular))
                .foregroundColor(Color("message_icon_color"))
                .padding(20)
        }
        .frame(width: size.width, height: size.height * 0.17, alignment: .center)
        .background(
            Color("message_top_bg")
        )
    }
    
    func _buildMessages(text: String) -> some View {
        VStack {
            Text(text)
                .font(.custom("JosefinSans-Regular", size: 15))
                .foregroundColor(.white)
                .multilineTextAlignment(.leading)
                .padding()
                .frame(minWidth: size.width * 0.6, alignment: .leading)
                .background(Color("message_msg_bg"))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .shadow(color: .black.opacity(0.25), radius: 4, x: 0, y: 4)
        }
        .frame(width: size.width * 0.9, alignment: .leading)
        .padding(.horizontal)
        .padding(.top, 10)
        .padding(.bottom, 0)
    }
    
    func _buildButtons() -> some View {
        HStack {
            Button(action: {}) {
                Text("1 - ACCEPT")
                    .font(.system(size: 16, weight: .regular))
                    .foregroundColor(.white)
                    .padding()
                    .background(Color("message_icon_color"))
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .shadow(color: .black.opacity(0.25), radius: 4, x: 0, y: 4)
            }
            
            Button(action: {}) {
                Text("2 - DECLINE")
                    .font(.system(size: 16, weight: .regular))
                    .foregroundColor(.white)
                    .padding()
                    .background(Color("message_red_button"))
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .shadow(color: .black.opacity(0.25), radius: 4, x: 0, y: 4)
            }
        }
        .frame(width: size.width * 0.9, alignment: .leading)
        .padding()
    }
    
    
    var _buildDeclineAnswer: some View {
        HStack {
            Button(action: {}) {
                Text("2 - DECLINE")
                    .font(.system(size: 16, weight: .regular))
                    .foregroundColor(.white)
                    .padding()
                    .background(Color("message_msg_answered"))
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .shadow(color: .black.opacity(0.25), radius: 4, x: 0, y: 4)
            }
        }
        .frame(width: size.width * 0.9, alignment: .trailing)
        .padding()
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView()
    }
}
