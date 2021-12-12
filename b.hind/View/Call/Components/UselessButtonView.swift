//
//  UselessButtonView.swift
//  b.hind
//
//  Created by HANNA P C FERREIRA on 22/11/21.
//

import SwiftUI

struct UselessButtonView: View {
    
    var buttonImage: String
    var sound: SoundOption
    
    @Binding var enabled: Bool
    
    var body: some View {

        Button {
            if enabled == true {
                enabled = false
                CallManager.instance.playSound(sound: sound)
            }
        } label: {
            Image(buttonImage)
                .frame(width: 78, height: 78, alignment: .center)
                .foregroundColor(enabled ? .white : Color("text_disabled_button"))
                .background(enabled ? Color("number_button") : Color("number_disabled_button"))
                .clipShape(Circle())
        }
        .padding(10)
        .disabled(enabled == false)
    }
}

struct UselessButtonView_Previews: PreviewProvider {
    static var previews: some View {
        UselessButtonView(buttonImage: "hashtag", sound: .options, enabled: .constant(false))
    }
}
