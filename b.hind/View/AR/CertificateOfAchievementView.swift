//
//  CertificateOfAchievementView.swift
//  b.hind
//
//  Created by Sthefanny Gonzaga on 25/11/21.
//

import SwiftUI

struct CertificateOfAchievementView : View {
    var body: some View {
        return ZStack {
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
                            
                            HStack {
                                Text("We congratulate")
                                    .font(.custom("JosefinSans-Regular", size: 12))
                                    .lineSpacing(10)
                                    .fixedSize(horizontal: true, vertical: false)
                                    .foregroundColor(.black)
                                    .multilineTextAlignment(.center)
                                
                                Text("(employee name here)")
                                    .font(.custom("SpecialElite-Regular", size: 10))
                                    .foregroundColor(.black)
                                    .fixedSize(horizontal: true, vertical: false)
                                    .overlay(
                                        GeometryReader { geo in
                                            Path { path in
                                                path.move(to: CGPoint(x: -2, y: geo.size.height))
                                                path.addLine(to: CGPoint(x: geo.size.width + 2, y: geo.size.height))
                                            }
                                            .stroke(style: StrokeStyle(lineWidth: 0.7, dash: [5, 3])) // adjust to your liking
                                            .foregroundColor(.black)
                                            .padding(.top, 3)
                                        }
                                    )
                                
                                Text("on succesfully")
                                    .font(.custom("JosefinSans-Regular", size: 12))
                                    .lineLimit(5)
                                    .lineSpacing(10)
                                    .fixedSize(horizontal: true, vertical: false)
                                    .foregroundColor(.black)
                                    .multilineTextAlignment(.center)
                            }
                            .padding(.top)
                            .padding(.bottom, 2)
                            .frame(width: geo.size.width * 0.85, alignment: .top)
                            
                            HStack {
                                Text("capturing the creature")
                                    .font(.custom("JosefinSans-Regular", size: 12))
                                    .lineLimit(5)
                                    .lineSpacing(10)
                                    .fixedSize(horizontal: true, vertical: false)
                                    .foregroundColor(.black)
                                    .multilineTextAlignment(.center)
                                
                                Text("shade")
                                    .font(.custom("SpecialElite-Regular", size: 10))
                                    .foregroundColor(.black)
                                    .fixedSize(horizontal: true, vertical: false)
                                    .overlay(
                                        GeometryReader { geo in
                                            Path { path in
                                                path.move(to: CGPoint(x: -40, y: geo.size.height))
                                                path.addLine(to: CGPoint(x: geo.size.width + 40, y: geo.size.height))
                                            }
                                            .stroke(style: StrokeStyle(lineWidth: 0.7, dash: [5, 3])) // adjust to your liking
                                            .foregroundColor(.black)
                                            .padding(.top, 3)
                                        }
                                    )
                                    .frame(width: geo.size.width * 0.26)
                                
                                Text("without")
                                    .font(.custom("JosefinSans-Regular", size: 12))
                                    .lineLimit(5)
                                    .lineSpacing(10)
                                    .fixedSize(horizontal: true, vertical: false)
                                    .foregroundColor(.black)
                                    .multilineTextAlignment(.center)
                            }
                            .padding(.bottom, 3)
                            .padding(.top, 0)
                            .frame(width: geo.size.width * 0.85, alignment: .top)
                            
                            Text("dying or suffering any irreparable harm!")
                                .font(.custom("JosefinSans-Regular", size: 12))
                                .lineLimit(5)
                                .lineSpacing(10)
                                .fixedSize(horizontal: true, vertical: false)
                                .foregroundColor(.black)
                                .multilineTextAlignment(.center)
                                .padding(.bottom)
                            
                            
                            Image("b.witched_logo")
                            
                            Image("ar_certificate_stamp")
                                .frame(width: geo.size.width * 0.88, alignment: .trailing)
                                .padding(.top, -10)
                            
                            HStack {
                                HStack {
                                    Text("©")
                                        .font(.custom("JosefinSans-Regular", size: 20))
                                        .foregroundColor(.black.opacity(0.4))
                                        .padding(.horizontal, 0)
                                    
                                    Text("1430")
                                        .font(.custom("JosefinSans-Regular", size: 11))
                                        .foregroundColor(.black.opacity(0.4))
                                        .padding(.horizontal, 0)
                                        .padding(.leading, -5)
                                        .padding(.top, -2)
                                }
                                
                                Spacer()
                                
                                Text("B.WITCHED INC.")
                                    .font(.custom("JosefinSans-Regular", size: 11))
                                    .foregroundColor(.black.opacity(0.4))
                                
                                Spacer()
                                
                                Text("MADE IN BR")
                                    .font(.custom("JosefinSans-Regular", size: 8))
                                    .foregroundColor(.black.opacity(0.4))
                                    .padding(.trailing, 10)
                            }
                            .padding(.top, -30)
                            .frame(width: geo.size.width * 0.78, alignment: .center)
                            
                        }
                        .background(
                            Image("ar_certificate")
                        )
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
        .edgesIgnoringSafeArea(.all)
        .navigationBarBackButtonHidden(true)
        .navigationBarTitle("")
        .onAppear{
            AnalyticsService().setView(name: CertificateOfAchievementView.self)
        }
    }
}

struct CertificateOfAchievementView_Previews : PreviewProvider {
    static var previews: some View {
        CertificateOfAchievementView()
    }
}
