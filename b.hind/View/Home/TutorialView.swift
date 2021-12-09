//
//  TutorialView.swift
//  b.hind
//
//  Created by HANNA P C FERREIRA on 09/12/21.
//

import SwiftUI

struct TutorialModel {
    let tutorialImage: String
    let tutorialText: String
    
    
}

struct TutorialView: View {
    @Binding var showTutorial: Bool
    @State var actualTutorial: Int = 0
    let size = UIScreen.main.bounds.size
    let tutorialModel = [TutorialModel(tutorialImage: "misty", tutorialText: "0"),
                         TutorialModel(tutorialImage: "misty", tutorialText: "1"),
                         TutorialModel(tutorialImage: "misty", tutorialText: "2"),
                         TutorialModel(tutorialImage: "misty", tutorialText: "3"),
                         TutorialModel(tutorialImage: "misty", tutorialText: "4"),
                         TutorialModel(tutorialImage: "misty", tutorialText: "5"),
                         TutorialModel(tutorialImage: "misty", tutorialText: "6"),
                         TutorialModel(tutorialImage: "misty", tutorialText: "7"),
                         TutorialModel(tutorialImage: "misty", tutorialText: "8"),
                         TutorialModel(tutorialImage: "misty", tutorialText: "9")
                        ]
    
    
    var body: some View {
        
        Button(action: {
            if actualTutorial < tutorialModel.count-1 {
                actualTutorial += 1
            }
            else {
                UserRepository().setShowOnboardingInfo(showOnboarding: false)
                showTutorial = false
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
                            Image(tutorialModel[actualTutorial].tutorialImage)
                                .resizable()
                                .frame(width: size.width * 0.2, height: size.height * 0.1, alignment: .leading)
                            Text(tutorialModel[actualTutorial].tutorialText)
                                .frame(width: size.width * 0.5, height: size.height * 0.1, alignment: .leading)
                                .font(.custom("JosefinSans-Regular", size: 17))
                                .foregroundColor(.black)
                        }
                        .frame(height: size.height * 0.18, alignment: .leading)
                        
                        HStack{
                            Text("c 1430")
                                .font(.custom("JosefinSans-Regular", size: 11))
                                .foregroundColor(.black)
                            Text("B.WITCHED INC.")
                                .font(.custom("JosefinSans-Regular", size: 11))
                                .foregroundColor(.black)
                            Text("MADE IN BR")
                                .font(.custom("JosefinSans-Regular", size: 11))
                                .foregroundColor(.black)
                        }

                    }
                    .background(
                        Image("tutorial_card")
                            .frame(alignment: .center)
                            .padding(.horizontal, 20)
                            .frame(width: size.width, height: size.height * 0.3, alignment: .center)
                    )
                    .frame(width: size.width, height: size.height * 0.3, alignment: .center)
                        
                    
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
    }
}

struct TutorialView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialView(showTutorial: .constant(true))
    }
}
