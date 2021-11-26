//
//  MailView.swift
//  b.hind
//
//  Created by Sthefanny Gonzaga on 22/11/21.
//

import SwiftUI

struct MailView : View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    var body: some View {
        return ZStack {
            GeometryReader { geo in
                Image("mail_bg")
                    .resizable()
                    .scaledToFill()
                    .frame(width: geo.size.width, height: geo.size.height)
                
                VStack {
                    HStack (alignment: .center) {
                        VStack (alignment: .leading) {
                            Text("First Case")
                                .foregroundColor(.white)
                                .padding(.bottom, 2)
                            
                            Text("Your first case will be to face a Shade")
                                .font(.system(size: 15))
                                .foregroundColor(.white)
                        }
                        .padding(.trailing, 20)
                        .frame(width: geo.size.width * 0.65, height: geo.size.height * 0.1, alignment: .leading)
                        
                        NavigationLink(destination: MonsterView()) {
                            Text("GO!")
                                .font(.system(size: 20, weight: .heavy, design: .default))
                                .foregroundColor(Color("mail_go_text"))
                                .frame(width: geo.size.width * 0.15, height: geo.size.height * 0.06, alignment: .center)
                                .background(Color("mail_go_button"))
                                .clipShape(RoundedRectangle(cornerRadius: 5))
                                .background(
                                    RoundedRectangle(cornerRadius: 5)
                                        .stroke(Color("mail_go_button"), lineWidth: 1)
                                )
                                .shadow(color: .black.opacity(0.25), radius: 4, x: 0, y: 4)
                        }
                    }
                    .frame(width: geo.size.width * 0.8, height: geo.size.height * 0.15, alignment: .center)
                    .padding(.horizontal, 25)
                    .background(Color("mail_case_bg"))
                    .clipShape(RoundedRectangle(cornerRadius: 14))
                    .background(
                        RoundedRectangle(cornerRadius: 14)
                            .stroke(Color("mail_case_bg"), lineWidth: 1)
                    )
                    .shadow(color: .black.opacity(0.25), radius: 4, x: 0, y: 4)
                    
                    Spacer()
                }
                .padding(.top, 100)
                .frame(width: geo.size.width, alignment: .center)
                
            }
            .edgesIgnoringSafeArea(.all)
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(
            leading: Button(action: {self.mode.wrappedValue.dismiss()}) {
                Image(systemName: "arrow.backward")
                    .frame(width: 39, height: 34)
            }.accentColor(Color("mail_title")),
            trailing: Text("B.Mail").foregroundColor(Color("mail_title")).font(.system(size: 34))
        )
    }
}

struct MailView_Previews : PreviewProvider {
    static var previews: some View {
        MailView()
    }
}
