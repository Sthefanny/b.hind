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
    
    @Binding var enabled: Bool
    
    var action: () -> Void
    
    var body: some View {

        Button {
            if enabled == true {
                enabled = false
                CallManager.instance.playSound(sound: sound)
                action()
            }
        } label: {
            Text(number.description)
                .frame(width: 78, height: 78, alignment: .center)
                .foregroundColor(enabled ? .white : Color("text_disabled_button"))
                .font(.system(size: 40, weight: .regular))
                .background(enabled ? Color("number_button") : Color("number_disabled_button"))
                .clipShape(Circle())
        }
        .padding(10)
        .disabled(enabled == false)
    }
}

struct CallButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CallButtonView(number: 0, sound: .options, enabled: .constant(false), action: {})
    }
}
