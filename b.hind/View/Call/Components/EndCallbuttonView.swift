//
//  EndCallbutton.swift
//  b.hind
//
//  Created by HANNA P C FERREIRA on 22/11/21.
//

import SwiftUI

struct EndCallbuttonView: View {
    
    var body: some View {

        Button {
            print("Call ended")
        } label: {
            NavigationLink(destination: CallingView()) {
            Image("no")
                .frame(width: 78, height: 78, alignment: .center)
                .background(Color(#colorLiteral(red: 0.8004596829, green: 0.4195397496, blue: 0.2883538306, alpha: 1)))
                .clipShape(Circle())}
            
        }
        .padding(20)
    
        
    }
}

struct EndCallbuttonView_Previews: PreviewProvider {
    static var previews: some View {
        EndCallbuttonView()
    }
}
