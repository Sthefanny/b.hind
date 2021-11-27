//
//  Call.swift
//  b.hind
//
//  Created by HANNA P C FERREIRA on 18/11/21.
//

import Foundation
import SwiftUI


struct CallView: View {
    
    var body: some View {
        ZStack (alignment: .center) {
            Image("call_bg")
                .resizable()
                .ignoresSafeArea()
            Rectangle()
                .foregroundColor(Color.black.opacity(0.20))
                .ignoresSafeArea()
            VStack{
                Spacer()
                Text("B.hind")
                    .foregroundColor(.white)
                    .font(.system(size: 32, weight: .regular))
                    .padding()
                Spacer()
                HStack{
                    CallButtonView(number: 1, sound: .call1)
                    CallButtonView(number: 2, sound: .call2)
                    CallButtonView(number: 3, sound: .call3)
                }//buttons - first line
                
                HStack{
                    CallButtonView(number: 4, sound: .options)
                    CallButtonView(number: 5, sound: .options)
                    CallButtonView(number: 6, sound: .options)
                }//buttons - second line
                
                HStack{
                    CallButtonView(number: 7, sound: .options)
                    CallButtonView(number: 8, sound: .options)
                    CallButtonView(number: 9, sound: .options)
                }//buttons - third line
                
                HStack{
                    UselessButtonView(buttonImage: "asterisk", sound: .options)
                    CallButtonView(number: 0, sound: .options)
                    UselessButtonView(buttonImage: "hashtag", sound: .options)
                }//buttons - fourth line
                
                HStack{
                    EndCallbuttonView()
                }
                .padding()
                
            }

        }
        .background(Color(.black))
        .navigationBarBackButtonHidden(true)
        .onAppear {
            CallManager.instance.playSound(sound: .proposal)
        }
        //main Zstack
    }
}


struct PreviewCallView_Previews: PreviewProvider {
    static var previews: some View {
        CallView()
//.previewInterfaceOrientation(.portrait)
//            .previewLayout(.device)
//            .previewInterfaceOrientation(.portrait)
    }
}
