//
//  MailView.swift
//  b.hind
//
//  Created by Sthefanny Gonzaga on 22/11/21.
//

import SwiftUI

struct MailView : View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @State private var showActionSheet = false
    
    var body: some View {
        return ZStack {
            GeometryReader { geo in
                Image("mail_bg")
                    .resizable()
                    .scaledToFill()
                    .frame(width: geo.size.width, height: geo.size.height)
                
                ZStack (alignment: .leading) {
                    VStack {}
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 32)
                            .foregroundColor(Color("mail_case_bg"))
                            .frame(width: geo.size.width * 0.92, height: geo.size.height * 0.12, alignment: .center)
                    )
                    .padding(.bottom, 30)
                    .frame(width: geo.size.width, height: geo.size.height * 0.2, alignment: .bottom)
                    
                    VStack (alignment: .leading) {
                        Text("Primeiro Caso")
                            .foregroundColor(.white)
                            .padding(.bottom, 2)
                        
                        Text("Seu primeiro caso será enfrentar um Shade")
                            .font(.system(size: 15))
                            .foregroundColor(.white)
                    }
                    .padding(.leading, 30)
                    .frame(width: geo.size.width * 0.9, height: geo.size.height * 0.17, alignment: .center)
                    .padding(.top, 80)
                }
                .padding(.bottom, 30)
                .frame(width: geo.size.width, height: geo.size.height, alignment: .top)
                .onTapGesture {
                    showActionSheet.toggle()
                }
                
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
        .actionSheet(isPresented: $showActionSheet) {
                    ActionSheet(
                        title: Text("Accept case?"),
                        buttons: [
                            .cancel { print(self.showActionSheet) },
                            .default(Text("Go"))
                        ]
                    )
                }
    }
}

struct MailView_Previews : PreviewProvider {
    static var previews: some View {
        MailView()
    }
}
