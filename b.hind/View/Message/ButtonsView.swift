//
//  ButtonsView.swift
//  b.hind
//
//  Created by Sthefanny Gonzaga on 12/12/21.
//

import SwiftUI

struct ButtonsView: View {
    let size = UIScreen.main.bounds.size
    @Binding var accepted: Bool
    @Binding var declined: Bool
    
    var body: some View {
        HStack {
            Button(action: {
                accepted = true
            }) {
                Text("1 - ACCEPT")
                    .font(.system(size: 16, weight: .regular))
                    .foregroundColor(.white)
                    .padding()
                    .background(Color("message_icon_color"))
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .shadow(color: .black.opacity(0.25), radius: 4, x: 0, y: 4)
            }
            
            Button(action: {
                declined = true
            }) {
                Text("2 - DECLINE")
                    .font(.system(size: 16, weight: .regular))
                    .foregroundColor(.white)
                    .padding()
                    .background(Color("message_red_button"))
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .shadow(color: .black.opacity(0.25), radius: 4, x: 0, y: 4)
            }
        }
        .frame(width: size.width * 0.9, alignment: .leading)
        .padding()
    }
}

struct ButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonsView(accepted: .constant(false), declined: .constant(false))
    }
}
