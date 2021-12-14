//
//  TutorialView.swift
//  b.hind
//
//  Created by HANNA P C FERREIRA on 09/12/21.
//

import SwiftUI

struct TutorialModel {
    let tutorialImage: String?
    let tutorialText: String
    
    
}

struct TutorialView: View {
    @Binding var showTutorial: Bool
    @State var actualTutorial: Int = 0
    let size = UIScreen.main.bounds.size
    let tutorialModel = [TutorialModel(tutorialImage: nil, tutorialText: "Oh look! If it isn't the new member of our crew! You look so... capable. AH! What was I thinking! It's me, Misty, and I'm here to help you start this experience!"),
                         TutorialModel(tutorialImage: nil, tutorialText: "So, let's get you situated! This is your new B.Screen! Here you will find all the apps and tools you'll need throughout this  journey! "),
                         TutorialModel(tutorialImage: "grim_icon", tutorialText: "The Grimoire, here you’ll find every creature you’ve captured, along with their stories, weaknesses and strenghts. Just to make sure you don’t forget any traumas."),
                         TutorialModel(tutorialImage: "bank_icon", tutorialText: "B.Bank is where you can take a look at all the money you didn't earn.  Welcome to the life of an Unpaid Intern!"),
                         TutorialModel(tutorialImage: "achievements_icon", tutorialText: "B.Good is an achievements app, where you can find what you’ve accomplished through this journey, and remember how good you once were."),
                         TutorialModel(tutorialImage: "time_icon", tutorialText: "B. on time is where you will punch the clock so we can control your working hours, and pay you 0 dollars them every month."),
                         TutorialModel(tutorialImage: "message_icon", tutorialText: "This is the message app, where you can read our job offer again, if you have any complaints... don't."),
                         TutorialModel(tutorialImage: "phone_icon", tutorialText: "By clicking on the phone icon, you can hear our first call all over again. You can’t resign or ask for a raise, don’t even try."),
                         TutorialModel(tutorialImage: "mail_icon", tutorialText: "And this... will be your most important, irreplaceable and valuable tool in your work..."),
                         TutorialModel(tutorialImage: "mail_icon", tutorialText: "The B.Mail, where you can find all the daily cases you must solve in order not to be... how can I say it... well, fired.")
                        ]
    
    
    var body: some View {
        
        Button(action: {
            if actualTutorial < tutorialModel.count-1 {
                actualTutorial += 1
            }
            else {
                TutorialRepository().setShowTutorial(showTutorial: true)
                let tutorialAlreadyShown = TutorialRepository().getShowTutorial()
                showTutorial = tutorialAlreadyShown == false
            }
        }
        ) {
            ZStack{
                Image("tutorial_bg")
                    .resizable()
                    .ignoresSafeArea()
                VStack (alignment: .center) {
                    Spacer()
                    VStack {
                        HStack {
                            if tutorialModel[actualTutorial].tutorialImage != nil {
                                Image(tutorialModel[actualTutorial].tutorialImage!)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: size.height * 0.12, alignment: .topLeading)
                            }
                            Text(tutorialModel[actualTutorial].tutorialText)
                                .font(.custom("JosefinSans-Regular", size: 15))
                                .foregroundColor(.black)
                                .multilineTextAlignment(.leading)
                                .frame(width: tutorialModel[actualTutorial].tutorialImage == nil ? size.width * 0.78 : size.width * 0.5, height: size.height * 0.15, alignment: .topLeading)
                                .padding(.top, 20)
                        }
                        .frame(height: size.height * 0.18, alignment: .topLeading)
                        
                        HStack{
                            Text("© 1430")
                                .font(.custom("JosefinSans-Regular", size: 11))
                                .foregroundColor(.black.opacity(0.4))
                            Spacer()
                            Text("B.WITCHED INC.")
                                .font(.custom("JosefinSans-Regular", size: 11))
                                .foregroundColor(.black.opacity(0.4))
                            Spacer()
                            Text("MADE IN BR")
                                .font(.custom("JosefinSans-Regular", size: 8))
                                .foregroundColor(.black.opacity(0.4))
                        }
                        .frame(width: size.width * 0.8)

                    }
                    .background(
                        Image("tutorial_card")
                            .frame(alignment: .center)
                            .padding(.horizontal, 20)
                            .frame(width: size.width, height: size.height * 0.3, alignment: .center)
                    )
                    .frame(width: size.width, height: size.height * 0.3, alignment: .center)
                    .padding(.horizontal)
                        
                    
                    Text("click anywhere to continue")
                        .font(.custom("JosefinSans-Regular", size: 15))
                        .foregroundColor(.white)
                        .padding(.bottom, 0)

                    Image("tutorial_misty")
                        .frame(width: size.width, alignment: .trailing)
                        .padding(0)
                        .ignoresSafeArea()
                        
                }
                .frame(width: size.width, height: size.height, alignment: .top)
            }
            .frame(width: size.width, height: size.height, alignment: .top)
        }
        .onAppear {
            AnalyticsService().setView(name: TutorialView.self)
        }
    }
}

struct TutorialView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialView(showTutorial: .constant(true))
    }
}
