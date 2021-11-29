//
//  FailView.swift
//  b.hind
//
//  Created by Sthefanny Gonzaga on 25/11/21.
//

import SwiftUI

struct FailView : View {
    var body: some View {
        return NavigationView {
            ZStack {
                Color.black.edgesIgnoringSafeArea(.all)
                
                GeometryReader { geo in
                    Image("ar_fail_bg")
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)
                        .frame(width: geo.size.width, height: geo.size.height)
                    
                    
                    VStack {
                        VStack {
                            
                            Text("UH-OH")
                                .font(.custom("JosefinSans-Bold", size: 48))
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                                .padding()
                                .frame(width: geo.size.width, height: geo.size.height * 0.1, alignment: .center)
                                .padding(.top, 20)
                            
                            Text("You’ve failed the simplest task we could give an unpaid intern :(\nBe careful or else you might lose your labor rights next time.")
                                .font(.custom("JosefinSans-Regular", size: 20))
                                .lineLimit(5)
                                .lineSpacing(5)
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                                .padding()
                                .frame(width: geo.size.width * 0.85, alignment: .top)
                            
                            NavigationLink(destination: MonsterView()) {
                                Text("Play again")
                                    .font(.custom("JosefinSans-Bold", size: 17))
                                    .foregroundColor(.white)
                                    .frame(width: geo.size.width * 0.61, height: geo.size.height * 0.07, alignment: .center)
                                    .background(Color("fail_play_again_button_bg"))
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                    .shadow(color: .black.opacity(0.25), radius: 4, x: 0, y: 4)
                            }
                            .frame(width: geo.size.width, height: geo.size.height * 0.2, alignment: .center)
                            
                        }
                        .frame(width: geo.size.width, height: geo.size.height * 0.72, alignment: .bottom)
                        
                        Spacer()
                        
                        NavigationLink(destination: HomeView()) {
                            Text("Back to Home")
                                .font(.custom("JosefinSans-Bold", size: 17))
                                .foregroundColor(.white)
                                .frame(width: geo.size.width * 0.4, height: geo.size.height * 0.07, alignment: .center)
                                .background(Color("fail_back_button_bg"))
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .shadow(color: .black.opacity(0.25), radius: 4, x: 0, y: 4)
                        }
                        .frame(width: geo.size.width, height: geo.size.height * 0.2, alignment: .center)
                    }
                    .frame(width: geo.size.width, height: geo.size.height, alignment: .center)
                    
                }
                .edgesIgnoringSafeArea(.all)
            }
        }
        .edgesIgnoringSafeArea(.all)
        .navigationBarBackButtonHidden(true)
        .navigationBarTitle("")
    }
}

struct FailView_Previews : PreviewProvider {
    static var previews: some View {
        FailView()
    }
}
