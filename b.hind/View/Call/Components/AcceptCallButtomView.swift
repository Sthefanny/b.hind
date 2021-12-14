//
//  AcceptCallButtomView.swift
//  b.hind
//
//  Created by HANNA P C FERREIRA on 23/11/21.
//

import SwiftUI

struct AcceptCallButtomView: View {
    var body: some View {
        Button {} label: {
            NavigationLink(destination: CallView()) {
            Image("yes")
                .frame(width: 78, height: 78, alignment: .center)
                .background(Color(#colorLiteral(red: 0.348320365, green: 0.6083550453, blue: 0.5911906362, alpha: 1)))
                .clipShape(Circle())
            }
        }
        .padding(20)
    }
}

struct AcceptCallButtomView_Previews: PreviewProvider {
    static var previews: some View {
        AcceptCallButtomView()
    }
}
