//
//  SingleMessageView.swift
//  b.hind
//
//  Created by Sthefanny Gonzaga on 12/12/21.
//

import SwiftUI

struct SingleMessageView: View {
    let size = UIScreen.main.bounds.size
    var text: String
    
    var body: some View {
        VStack {
            Text(text)
                .font(.custom("JosefinSans-Regular", size: 15))
                .foregroundColor(.white)
                .multilineTextAlignment(.leading)
                .padding()
                .frame(minWidth: size.width * 0.6, minHeight: size.height * 0.11, alignment: .leading)
                .background(Color("message_msg_bg"))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .shadow(color: .black.opacity(0.25), radius: 4, x: 0, y: 4)
        }
        .frame(width: size.width * 0.9, alignment: .leading)
        .padding(.horizontal)
        .padding(.top, 10)
        .padding(.bottom, 0)
    }
}

struct SingleMessageView_Previews: PreviewProvider {
    static var previews: some View {
        SingleMessageView(text: "Teste")
    }
}
