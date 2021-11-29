//
//  GameOverVersion1View.swift
//  b.hind
//
//  Created by HANNA P C FERREIRA on 28/11/21.
//

import SwiftUI

struct GameOverVersion1View: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    var body: some View {
        
        ZStack{
            Image("journal")
                .resizable()
                .ignoresSafeArea()
            
            ScrollView {
                VStack (alignment: .center, spacing: 20) {
                    
                    Text("B.NEWS")
                        .font(.custom("JosefinSans-Bold", size: 48))
                        .foregroundColor(.black)
                        .padding(.top, 50)
                        .padding(.bottom, -15)
                    Rectangle()
                        .frame(width: UIScreen.main.bounds.size.width * 1, height: UIScreen.main.bounds.size.height * 0.003, alignment: .center)
                    
                    Text("The least periodic newspaper you'll ever see")
                        .font(.custom("JosefinSans-Regular", size: 17))
                        .foregroundColor(.black)
                        .lineLimit(1)
                        .padding(.horizontal, 10)

                    Rectangle()
                        .frame(width: UIScreen.main.bounds.size.width * 1, height: UIScreen.main.bounds.size.height * 0.003, alignment: .center)
                    
                    Text("The refusal of B.Witched's offer and how it ruined our lives")
                        .font(.custom("JosefinSans-Bold", size: 20))
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.black)
                        .padding(.horizontal, 20)
                    
                    HStack {
                        VStack (alignment: .leading, spacing: 20) {
                            Text("6 months before today our headline was about the same subject and we were clueless of so many things. Humanity's last hope was selfish enough to abandon us, and there was nothing we could do.\n\nToday we still have so many questions, but one thing we know for sure: the day of our ruin has arrived!\n\nSupernatural beings have managed to enter our reality, no one can stop them anymore! Without B.Witched’s tools we’re doomed.")
                                .font(.custom("JosefinSans-Regular", size: 18))
                                .multilineTextAlignment(.leading)
                                .foregroundColor(.black)
                                .padding(.leading, 20)
                                .padding(.top, 0)
                            Spacer()
                        }
                        VStack (alignment: .leading, spacing: 16) {
                            Image("photo_journal")
                                .padding(.trailing, 20)
                                .padding(.top, 0)
                            Text("HUMANITY IS OVER, AND IT'S YOUR FAULT.")
                                .font(.custom("JosefinSans-Bold", size: 17))
                                .multilineTextAlignment(.leading)
                                .foregroundColor(.black)
                                .padding(.trailing, 20)
                                
                            Text(".your mother")
                                .font(.custom("JosefinSans-Regular", size: 12))
                                .multilineTextAlignment(.leading)
                                .foregroundColor(.black)
                                .padding(.trailing, 20)
                                .padding(.top, -16)
                            Text("Pope John XXIII made a statement at the Vatican “No one can save us anymore, if only we could go back in time.")
                                .font(.custom("JosefinSans-Regular", size: 17))
                                .multilineTextAlignment(.leading)
                                .foregroundColor(.black)
                                .padding(.trailing, 20)
                            Spacer()
                        }
                    }
                    
                    Button(action: {
                        self.mode.wrappedValue.dismiss()
                    }) {
                        Text("Go back in time")
                            .font(.custom("JosefinSans-Bold", size: 17))
                            .foregroundColor(.white)
                            .frame(width: UIScreen.main.bounds.width * 0.4, height: UIScreen.main.bounds.size.height * 0.07, alignment: .center)
                            .background(Color("fail_back_button_bg"))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .shadow(color: .black.opacity(0.25), radius: 4, x: 0, y: 4)
                    }
                    .padding(.bottom, 50)
     
                    Spacer()
                }
                .frame(width: UIScreen.main.bounds.size.width * 1, height: UIScreen.main.bounds.size.height * 1, alignment: .center)
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarTitle("")
        .frame(width: UIScreen.main.bounds.size.width * 1, height: UIScreen.main.bounds.size.height * 1, alignment: .center)

    }
}

struct GameOverVersion1View_Previews: PreviewProvider {
    static var previews: some View {
        GameOverVersion1View()
    }
}
