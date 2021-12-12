//
//  EndCallbutton.swift
//  b.hind
//
//  Created by HANNA P C FERREIRA on 22/11/21.
//

import SwiftUI

struct EndCallbuttonView: View {
    @Binding var enabled: Bool
    
    var body: some View {

        Button {
            print("Call ended")
        } label: {
            NavigationLink(destination: CallingView()) {
            Image("no")
                .foregroundColor(enabled ? .white : Color("text_end_disabled_button"))
                .frame(width: 78, height: 78, alignment: .center)
                .background(enabled ? Color("end_button") : Color("end_disabled_button"))
                .clipShape(Circle())}
            
        }
        .padding(20)
        .disabled(enabled == false)
    }
}

struct EndCallbuttonView_Previews: PreviewProvider {
    static var previews: some View {
        EndCallbuttonView(enabled: .constant(false))
    }
}
