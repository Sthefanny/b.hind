//
// Created by Sthefanny Gonzaga on 22/11/21.
//

import SwiftUI

struct HomeView : View {
    var body: some View {
        return NavigationView {
            ZStack {
                Color.black.edgesIgnoringSafeArea(.all)
                
                GeometryReader { geo in
                    Image("home_bg")
                        .resizable()
                        .scaledToFill()
                        .frame(width: geo.size.width, height: geo.size.height)
                    
                        VStack (alignment: .center) {
                            VStack (alignment: .leading) {
                                Text("B.hint")
                                    .fontWeight(.bold)
                                    .foregroundColor(Color("home_title"))
                                    .padding(.bottom, 2)
                                    .padding(.top, 10)
                                
                                Text("Use earphones for a better experience with our spatial audio, we are not responsible for occasional heart attacks or the voices in your head.")
                                    .font(.system(size: 15))
                                    .foregroundColor(.white)
                                    .padding(.bottom, 2)
                            }
                            .padding(.horizontal, 25)
                            .frame(width: geo.size.width * 0.9, height: geo.size.height * 0.16, alignment: .center)
                            .background(Color("home_hint_bg").opacity(0.72))
                            .clipShape(RoundedRectangle(cornerRadius: 25))
                            .background(
                                RoundedRectangle(cornerRadius: 25)
                                    .stroke(Color("home_hint_bg").opacity(0.72), lineWidth: 1)
                            )
                            .padding(.top, 80)
                        
                            HStack (alignment: .top) {
                                Spacer()
                                VStack (alignment: .center)  {
                                    VStack (alignment: .center) {
                                        Image("achievements_icon")
                                                .resizable()
                                                .scaledToFill()
                                                .frame(width: geo.size.width * 0.1, height: geo.size.height * 0.1, alignment: .center)
                                        
                                        Text("B.good")
                                            .font(.system(size:15))
                                            .foregroundColor(.white)
                                    }

                                    VStack (alignment: .center) {
                                        Image("bank_icon")
                                                .resizable()
                                                .scaledToFill()
                                                .frame(width: geo.size.width * 0.1, height: geo.size.height * 0.1, alignment: .center)
                                            .padding(.top, 10)
                                        
                                        Text("B.bank")
                                            .font(.system(size:15))
                                            .foregroundColor(.white)
                                    }
                                }
                                Spacer()
                                VStack (alignment: .center) {
                                    HStack {
                                        VStack (alignment: .center) {
                                            Image("time_icon")
                                                    .resizable()
                                                    .scaledToFill()
                                                    .frame(width: geo.size.width * 0.1, height: geo.size.height * 0.1, alignment: .center)
                                            
                                            Text("B.on time")
                                                .font(.system(size:15))
                                                .foregroundColor(.white)
                                        }
                                        Spacer()
                                        VStack (alignment: .center) {
                                            Image("grim_icon")
                                                    .resizable()
                                                    .scaledToFill()
                                                .frame(width: geo.size.width * 0.1, height: geo.size.height * 0.1, alignment: .center)
                                            
                                            Text("B.grim")
                                                .font(.system(size:15))
                                                .foregroundColor(.white)
                                        }
                                    }
                                    Image("widget_1")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: geo.size.width * 0.3, height: geo.size.height * 0.3)
                                        .padding(.top, 10)
                                }
                                .padding(.horizontal, 70)
                                
                            }
                            .padding(.top, 30)
                            .frame(width: geo.size.width, alignment: .center)
                            Spacer()
                        }
                    .padding(.bottom, 30)
                    .frame(width: geo.size.width, height: geo.size.height, alignment: .top)
                    
                       
                    
                    ZStack {
                        HStack {
                            NavigationLink(destination: MailView()) {
                                Image("message_icon")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: geo.size.width * 0.1, height: geo.size.height * 0.1, alignment: .trailing)
                                    .padding(.top, 10)
                                    .padding(.bottom, 5)
                            }
                            NavigationLink(destination: MailView()) {
                                Image("phone_icon")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: geo.size.width * 0.1, height: geo.size.height * 0.1, alignment: .center)
                                    .padding(.top, 10)
                                    .padding(.leading, 45)
                                    .padding(.trailing, 45)
                                    .padding(.bottom, 5)
                            }
                            NavigationLink(destination: MailView()) {
                                Image("mail_icon")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: geo.size.width * 0.1, height: geo.size.height * 0.1, alignment: .leading)
                                    .padding(.top, 10)
                                    .padding(.bottom, 5)
                            }
                        }
                        .frame(width: geo.size.width * 0.9, height: geo.size.height * 0.12, alignment: .center)
                        .background(Color("home_bottom_group").opacity(0.6))
                        .clipShape(RoundedRectangle(cornerRadius: 32))
                        .background(
                            RoundedRectangle(cornerRadius: 32)
                                .stroke(Color("home_bottom_group").opacity(0.6), lineWidth: 1)
                        )
                        
                    }
                    .padding(.bottom, 30)
                    .frame(width: geo.size.width, height: geo.size.height, alignment: .bottom)
                    
                }
                .edgesIgnoringSafeArea(.all)
            }
        }
    }
}

struct HomeView_Previews : PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
