//
//  CallButtonView.swift
//  b.hind
//
//  Created by HANNA P C FERREIRA on 22/11/21.
//

import SwiftUI

struct CallButtonView: View {
    
    var number: Int
    var sound: SoundOption
    
    var body: some View {

        Button {
            CallManager.instance.playSound(sound: sound)
        } label: {
            Text(number.description)
                .frame(width: 78, height: 78, alignment: .center)
                .foregroundColor(.white)
                .font(.system(size: 40, weight: .regular))
                .background(Color(#colorLiteral(red: 0.4144634604, green: 0.4275550246, blue: 0.432397306, alpha: 1)))
                .clipShape(Circle())
        }
        .padding(10)
    }
}

struct CallButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CallButtonView(number: 0, sound: .options)
    }
}
