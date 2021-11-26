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
                Color.black.edgesIgnoringSafeArea(.all)
                
                GeometryReader { geo in
                    
                    Image("ar_success_bg")
                        .resizable()
                        .scaledToFill()
                        .frame(width: geo.size.width, height: geo.size.height)
                    
                    VStack {
                        
                    }
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
