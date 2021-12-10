//
//  MailView.swift
//  b.hind
//
//  Created by Sthefanny Gonzaga on 22/11/21.
//

import SwiftUI

struct MailView : View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    let size = UIScreen.main.bounds.size
    
    var body: some View {
        return ZStack {
            Image("mail_bg")
                .resizable()
                .scaledToFill()
                .frame(width: size.width, height: size.height)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                buildSearchField
                buildFirstCase
                
                Spacer()
            }
            .frame(width: size.width, height: size.height * 0.85, alignment: .center)
            
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarTitle("")
        .navigationBarItems(leading: buildAppBar)
    }
    
    var buildAppBar: some View {
        HStack {
            Button(action: {
                self.mode.wrappedValue.dismiss()
            }) {
                Image(systemName: "arrow.backward")
                    .font(.system(size: 35, weight: .regular))
                    .foregroundColor(.white)
            }
            
            Spacer()
            
            Text("B.Mail")
                .font(.custom("JosefinSans-Bold", size: 34))
                .foregroundColor(.white)
                .padding(.trailing, 20)
        }
        .frame(width: size.width * 0.95, alignment: .center)
    }
    
    var buildSearchField: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(Color("mail_case_bg"))
            
            Text("Search")
                .font(.system(size: 17, weight: .regular))
                .foregroundColor(Color("mail_case_bg"))
        }
        .frame(width: size.width * 0.9, height: size.height * 0.04, alignment: .leading)
        .padding(.horizontal, 5)
        .background(Color("mail_search_bg"))
        .clipShape(RoundedRectangle(cornerRadius: 7))
        .padding(.bottom, 20)
    }
    
    var buildFirstCase: some View {
        HStack (alignment: .center) {
            VStack (alignment: .leading) {
                Text("First Case")
                    .font(.system(size: 17, weight: .semibold))
                    .foregroundColor(.white)
                    .padding(.bottom, 2)
                
                Text("Your first case will be to face a Shade")
                    .font(.system(size: 15, weight: .regular))
                    .foregroundColor(.white)
            }
            .padding(.trailing, 20)
            .frame(width: size.width * 0.65, height: size.height * 0.1, alignment: .leading)
            
            NavigationLink(destination: MonsterView()) {
                Text("GO!")
                    .font(.custom("JosefinSans-Bold", size: 20))
                    .foregroundColor(Color("mail_go_text"))
                    .padding(.top, 7)
                    .frame(width: size.width * 0.15, height: size.height * 0.06, alignment: .center)
                    .background(Color("mail_go_button"))
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                    .shadow(color: .black.opacity(0.25), radius: 4, x: 0, y: 4)
            }
        }
        .frame(width: size.width * 0.8, height: size.height * 0.15, alignment: .center)
        .padding(.horizontal, 25)
        .background(Color("mail_case_bg"))
        .clipShape(RoundedRectangle(cornerRadius: 14))
        .shadow(color: .black.opacity(0.25), radius: 4, x: 0, y: 4)
    }
}

struct MailView_Previews : PreviewProvider {
    static var previews: some View {
        MailView()
    }
}
