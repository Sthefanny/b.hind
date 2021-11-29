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
                .foregroundColor(.white)
                .background(Color(#colorLiteral(red: 0.4144634604, green: 0.4275550246, blue: 0.432397306, alpha: 1)))
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
