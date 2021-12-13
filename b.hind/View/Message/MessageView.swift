//
//  MessageView.swift
//  b.hind
//
//  Created by Sthefanny Gonzaga on 10/12/21.
//

import SwiftUI
import Firebase
import FirebaseAnalytics

struct MessageView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    let size = UIScreen.main.bounds.size
    
    let messageList = [
        "Hi, I'm Misty, recruiter and trainer at B.Witched, a company founded in 1430 by Joana Darc.",
        "B.Witched is pioneer in capturing supernatural beings and the best in the business of maintaining our plane of existence.",
        "I have a unique opportunity to offer you! We have an internship position available for our B.Hind team, and luckily (or not), we think your profile is perfect for the position.",
        "Enter 1 to accept this wonderful internship program.",
        "Enter 2 to reject the internship program and continue to be mediocre.",
    ]
    
    @State var messagesToShow = [Any]()
    @State var showButton = false
    @State var accepted = false
    @State var declined = false
    @State var showHome = false
    @State var showGameOver = false
    
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
                    ScrollViewReader { scrollView in
                        ScrollView {
                            ForEach(0..<messagesToShow.count, id: \.self) { index in
                                SingleMessageView(text: messageList[index])
                                    .id(index)
                            }
                            
                            if showButton {
                                ButtonsView(accepted: $accepted, declined: $declined)
                                    .id(messagesToShow.count + 1)
                            }

                            if declined {
                                _buildDeclineSent
                                _buildDeclineAnswer
                                _buildContinueButton
                                    .id(messagesToShow.count + 2)
                                    .onAppear {
                                        scrollView.scrollTo(messagesToShow.count + 2)
                                    }
                                NavigationLink("", destination: GameOverVersion1View(), isActive: $showGameOver)
                            }
                            
                            if accepted {
                                _buildAcceptSent
                                _buildAcceptAnswer
                                _buildContinueButton
                                    .id(messagesToShow.count + 2)
                                    .onAppear {
                                        scrollView.scrollTo(messagesToShow.count + 2)
                                    }
                                NavigationLink("", destination: HomeView(), isActive: $showHome)
                            }
                        }

                    }
                }
                
                Spacer()
            }
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
        .onAppear {
            UserRepository().setShowOnboardingInfo(showOnboarding: false)
            
            showContentByTime()
            
            Analytics.logEvent(AnalyticsEventScreenView,
                           parameters: [AnalyticsParameterScreenName: "\(MessageView.self)",
                                        AnalyticsParameterScreenClass: "\(MessageView.self)"])
        }
    }
    
    func showContentByTime() -> Void {
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            var counter = 0
            
            Timer.scheduledTimer(withTimeInterval: 1.5, repeats: true) { timer in
                if messagesToShow.count < messageList.count {
                    self.messagesToShow.append(messageList[counter])
                    counter += 1
                }
                else {
                    self.showButton = true
                    timer.invalidate()
                }
            }
        }
    }
    
    var _buildTop: some View {
        HStack {
            Button(action: {
                self.mode.wrappedValue.dismiss()
            }) {
                Image(systemName: "chevron.left")
                    .font(.system(size: 20, weight: .regular))
                    .foregroundColor(Color("message_icon_color"))
                    .padding(20)
            }
            
            Spacer()
            
            VStack {
                Image("misty_identified")
                Text("Misty - B.Witched")
                    .font(.custom("JosefinSans-Bold", size: 17))
                    .foregroundColor(.white)
            }
            
            Spacer()
            
            NavigationLink(destination: CallView()) {
                Image(systemName: "phone")
                    .font(.system(size: 20, weight: .regular))
                    .foregroundColor(Color("message_icon_color"))
                    .padding(20)
            }
        }
        .frame(width: size.width, height: size.height * 0.17, alignment: .center)
        .background(
            Color("message_top_bg")
        )
    }
    
    var _buildDeclineSent: some View {
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
    
    var _buildAcceptSent: some View {
        HStack {
            Button(action: {}) {
                Text("1 - ACCEPT")
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
    
    var _buildDeclineAnswer: some View {
        HStack {
            Text("You turned down the internship offer and decided to remain mediocre. Have a bad day.")
                .font(.custom("JosefinSans-Regular", size: 15))
                .foregroundColor(.white)
                .multilineTextAlignment(.leading)
                .padding()
                .frame(minWidth: size.width * 0.6, alignment: .leading)
                .background(Color("message_msg_bg"))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .shadow(color: .black.opacity(0.25), radius: 4, x: 0, y: 4)
        }
        .frame(width: size.width * 0.9, alignment: .trailing)
        .padding(.horizontal)
        .padding(.top, 10)
        .padding(.bottom, 0)
    }
    
    var _buildAcceptAnswer: some View {
        HStack {
            Text("Congratulations! You are the newest unpaid intern on the B.Hind team! I hope you are prepared to risk your life in order to maintain the reality in which we live.")
                .font(.custom("JosefinSans-Regular", size: 15))
                .foregroundColor(.white)
                .multilineTextAlignment(.leading)
                .padding()
                .frame(minWidth: size.width * 0.6, minHeight: size.height * 0.11, alignment: .leading)
                .background(Color("message_msg_bg"))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .shadow(color: .black.opacity(0.25), radius: 4, x: 0, y: 4)
        }
        .frame(width: size.width * 0.9, alignment: .trailing)
        .padding(.horizontal)
        .padding(.top, 10)
        .padding(.bottom, 0)
    }
    
    var _buildContinueButton: some View {
        HStack {
            Button(action: {
                if accepted {
                    showHome = true
                } else if declined {
                    showGameOver = true
                }
            }) {
                Text("CONTINUE")
                    .font(.system(size: 16, weight: .regular))
                    .foregroundColor(.white)
                    .padding()
                    .background(Color("message_icon_color"))
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .shadow(color: .black.opacity(0.25), radius: 4, x: 0, y: 4)
            }
        }
        .frame(width: size.width * 0.9, alignment: .leading)
        .padding()
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView()
    }
}
