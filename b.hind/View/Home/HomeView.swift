//
// Created by Sthefanny Gonzaga on 22/11/21.
//

import SwiftUI

struct HomeView : View {
    var body: some View {
        return NavigationView {
            ZStack {
                GeometryReader { geo in
                    Image("home_bg")
                        .resizable()
                        .scaledToFill()
                        .frame(width: geo.size.width, height: geo.size.height)
                    
                    ZStack (alignment: .leading) {
                        VStack {}
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 32)
                                .foregroundColor(Color("home_hint_bg").opacity(0.72))
                                .frame(width: geo.size.width * 0.92, height: geo.size.height * 0.17, alignment: .center)
                        )
                        .padding(.bottom, 30)
                        .frame(width: geo.size.width, height: geo.size.height * 0.2, alignment: .bottom)
                        
                        VStack (alignment: .leading) {
                            Text("B.hint")
                                .foregroundColor(Color("home_title"))
                                .padding(.bottom, 2)
                            
                            Text("Use earphones for a better experience with our spatial audio, we are not responsible for occasional heart attacks or the voices in your head.")
                                .font(.system(size: 15))
                                .foregroundColor(.white)
                        }
                        .padding(.leading, 30)
                        .padding(.top, 40)
                        .frame(width: geo.size.width * 0.9, height: geo.size.height * 0.17, alignment: .center)
                        .padding(.top, 40)
                    }
                    .padding(.bottom, 30)
                    .frame(width: geo.size.width, height: geo.size.height, alignment: .top)
                    
                    ZStack {
                        VStack {}
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 32)
                                .foregroundColor(Color("home_bottom_group").opacity(0.6))
                                .frame(width: geo.size.width * 0.92, height: geo.size.height * 0.12, alignment: .center)
                        )
                        .padding(.bottom, 30)
                        .frame(width: geo.size.width, height: geo.size.height * 0.2, alignment: .bottom)
                        
                        NavigationLink(destination: MailView()) {
                            Image("mail_icon")
                                .resizable()
                                .scaledToFill()
                                .frame(width: geo.size.width * 0.1, height: geo.size.height * 0.1, alignment: .bottom)
                                .padding(.top, 85)
                        }
                        
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
