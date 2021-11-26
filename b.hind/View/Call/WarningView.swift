//
//  warningView.swift
//  b.hind
//
//  Created by HANNA P C FERREIRA on 24/11/21.
//

import SwiftUI

struct WarningView: View {
    
    var body: some View {
        
        NavigationView {

            ZStack{
                Color.black
                    .ignoresSafeArea()
                VStack (alignment: .center){
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
                NavigationLink(destination: CallingView()) {
                    Rectangle()
                        .foregroundColor(Color.black.opacity(0.01))
                        .navigationBarBackButtonHidden(true)
                        .ignoresSafeArea()
                }
            }
            .navigationBarBackButtonHidden(true)
            
            
        } //navigationview
        
        
    }
}

struct warningView_Previews: PreviewProvider {
    static var previews: some View {
        WarningView()
    }
}
