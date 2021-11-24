//
//  warningView.swift
//  b.hind
//
//  Created by HANNA P C FERREIRA on 24/11/21.
//

import SwiftUI

struct WarningView: View {
    
    var body: some View {
        
        ZStack{
            Color.black
                .ignoresSafeArea()
            
            VStack (alignment: .center){
                Spacer()
                
                Text("WARNING")
                    .foregroundColor(.white)
                    .font(.custom("JosefinSans-Bold", size: 34))
                    .padding()
                
                Text("This game contains loud noises,\njumpsacres and mature language.\n\nPlayer discretion is advised.")
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .font(.custom("JosefinSans-Regular", size: 18))
                
                
                Spacer()
                
                Image("audio")
                    .frame(width: 108, height: 108, alignment: .center)
                
                Text("best played with headphones")
                    .foregroundColor(.white)
                    .font(.custom("JosefinSans-Regular", size: 18))
                    .padding(40)
                
                Spacer()
            }
        }
    }
}

struct warningView_Previews: PreviewProvider {
    static var previews: some View {
        WarningView()
    }
}
