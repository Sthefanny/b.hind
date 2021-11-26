//
//  CertificateOfAchievementView.swift
//  b.hind
//
//  Created by Sthefanny Gonzaga on 25/11/21.
//

import SwiftUI

struct CertificateOfAchievementView : View {
    var body: some View {
        return NavigationView {
            ZStack {
//                Color.black.edgesIgnoringSafeArea(.all)
                
                GeometryReader { geo in
                    
                    Text("Certificate of Achievement")
                        .padding(.top, 100)
                }
                .edgesIgnoringSafeArea(.all)
            }
        }
    }
}

struct CertificateOfAchievementView_Previews : PreviewProvider {
    static var previews: some View {
        CertificateOfAchievementView()
    }
}
