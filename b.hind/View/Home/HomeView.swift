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
                    
                    ZStack (alignment: .leading) {
                        VStack (alignment: .leading) {
                            VStack (alignment: .leading) {
                                Text("B.hint")
                                    .foregroundColor(Color("home_title"))
                                    .padding(.bottom, 2)
                                
                                Text("Use earphones for a better experience with our spatial audio, we are not responsible for occasional heart attacks or the voices in your head.")
                                    .font(.system(size: 15))
                                    .foregroundColor(.white)
                            }
                            .padding(.horizontal, 20)
                        }
                        .frame(width: geo.size.width * 0.9, height: geo.size.height * 0.16, alignment: .center)
                        .background(Color("home_hint_bg").opacity(0.72))
                        .clipShape(RoundedRectangle(cornerRadius: 32))
                        .background(
                            RoundedRectangle(cornerRadius: 32)
                                .stroke(Color("home_hint_bg").opacity(0.72), lineWidth: 1)
                        )
                        .padding(.horizontal, 60)
                        .padding(.top, 80)
                        
                    }
                    .padding(.bottom, 30)
                    .frame(width: geo.size.width, height: geo.size.height, alignment: .top)
                    
                    ZStack {
                        HStack {
                            NavigationLink(destination: MailView()) {
                                Image("mail_icon")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: geo.size.width * 0.1, height: geo.size.height * 0.1, alignment: .center)
                                    .padding(.top, 10)
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
        .navigationBarBackButtonHidden(true)
    }
}

struct HomeView_Previews : PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
