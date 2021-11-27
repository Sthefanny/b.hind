//
//  CertificateOfAchievementView.swift
//  b.hind
//
//  Created by Sthefanny Gonzaga on 25/11/21.
//

import SwiftUI

struct CertificateOfAchievementView : View {
    var body: some View {
        return NavigationView {
            ZStack {
                Color.black.edgesIgnoringSafeArea(.all)
                
                Image("ar_success_bg")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                
                GeometryReader { geo in
                    
                    VStack {
                        Spacer()
                        ZStack {
                            VStack {
                                Text("Certificate \nof Achievement")
                                    .font(.custom("JosefinSans-Bold", size: 25))
                                    .foregroundColor(.black)
                                    .multilineTextAlignment(.center)
                                    .padding()
                                    .frame(width: geo.size.width, height: geo.size.height * 0.1, alignment: .center)
                                    .padding(.top, 20)
                                
                                Text("We congratulate _______________ on succesfully capturing the creature _______________ without dying or suffering any irreparable harm!")
                                    .font(.custom("JosefinSans-Regular", size: 12))
                                    .lineLimit(5)
                                    .lineSpacing(10)
                                    .foregroundColor(.black)
                                    .multilineTextAlignment(.center)
                                    .padding()
                                    .frame(width: geo.size.width * 0.85, alignment: .top)
                                
                                Image("b.witched_logo")
                                
                                Image("ar_certificate_stamp")
                                    .frame(width: geo.size.width * 0.88, alignment: .trailing)
                                    .padding(.top, -20)
                                
                            }
                            .background(
                                Image("ar_certificate")
                            )
                            
                            Text("(employee name here)")
                                .font(.custom("SpecialElite-Regular", size: 10))
                                .foregroundColor(.black)
                                .padding(.top, -72)
                                .padding(.leading, 17)
                            
                            Text("shade")
                                .font(.custom("SpecialElite-Regular", size: 10))
                                .foregroundColor(.black)
                                .padding(.top, -48)
                                .padding(.leading, 80)
                            
                            Text("©")
                                .font(.custom("JosefinSans-Regular", size: 20))
                                .foregroundColor(.black.opacity(0.4))
                                .padding(.leading, 40)
                                .frame(width: geo.size.width, height: geo.size.height * 0.46, alignment: .bottomLeading)
                            
                            Text("1430")
                                .font(.custom("JosefinSans-Regular", size: 11))
                                .foregroundColor(.black.opacity(0.4))
                                .padding(.leading, 60)
                                .frame(width: geo.size.width, height: geo.size.height * 0.45, alignment: .bottomLeading)
                            
                            Text("B.WITCHED INC.")
                                .font(.custom("JosefinSans-Regular", size: 11))
                                .foregroundColor(.black.opacity(0.4))
                                .frame(width: geo.size.width, height: geo.size.height * 0.45, alignment: .bottom)
                            
                            Text("MADE IN BR")
                                .font(.custom("JosefinSans-Regular", size: 11))
                                .foregroundColor(.black.opacity(0.4))
                                .padding(.trailing, 50)
                                .frame(width: geo.size.width, height: geo.size.height * 0.45, alignment: .bottomTrailing)
                        }
                        
                        NavigationLink(destination: HomeView()) {
                            Text("Back to Home")
                                .font(.custom("JosefinSans-SemiBold", size: 17))
                                .foregroundColor(.black)
                                .frame(width: geo.size.width * 0.6, height: geo.size.height * 0.07, alignment: .center)
                                .background(Color("certificate_back_button_bg"))
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .shadow(color: .black.opacity(0.25), radius: 4, x: 0, y: 4)
                        }
                        .frame(width: geo.size.width, height: geo.size.height * 0.2, alignment: .center)
                        
                        Spacer()
                    }
                    .frame(width: geo.size.width, height: geo.size.height, alignment: .center)
                }
            }
        }
        .edgesIgnoringSafeArea(.all)
        .navigationBarBackButtonHidden(true)
        .navigationBarTitle("")
    }
}

struct CertificateOfAchievementView_Previews : PreviewProvider {
    static var previews: some View {
        CertificateOfAchievementView()
    }
}
