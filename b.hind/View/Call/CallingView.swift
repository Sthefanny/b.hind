//
//  Calling.swift
//  b.hind
//
//  Created by HANNA P C FERREIRA on 23/11/21.
//

import SwiftUI
import AVKit

struct CallingView: View {
    
    var body: some View {
        
        ZStack (alignment: .center) {
            
            Image("call_bg")
                .resizable()
                .ignoresSafeArea()
            Rectangle()
                .foregroundColor(Color.black.opacity(0.20))
                .ignoresSafeArea()
            VStack{
                VStack{
                    Image("misty")
                        .frame(width: 141, height: 141, alignment: .center)
                        .padding(.top)
                        .padding(.top)
     
                    Text("Unkown Caller")
                        .foregroundColor(.white)
                        .font(.system(size: 34, weight: .regular))
                        .padding(30)
                }
                .padding(.top)
                .padding(.top)
                Spacer()


                HStack{
                    EndCallbuttonView()
                        .padding()
                    AcceptCallButtomView()
                        .padding()
                }
                .padding(.bottom)

            }
            
        }
        .navigationBarBackButtonHidden(true)
        .onAppear {
            CallManager.instance.playSound(sound: .ringtone)
        }
    }
}

struct Calling_Previews: PreviewProvider {
    static var previews: some View {
        CallingView()
    }
}
