//
//  Call.swift
//  b.hind
//
//  Created by HANNA P C FERREIRA on 18/11/21.
//

import Foundation
import SwiftUI


struct PreviewCallView: View {
    
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
                    CallButtonView(number: 1)
                    CallButtonView(number: 2)
                    CallButtonView(number: 3)
                }//buttons - first line
                
                HStack{
                    CallButtonView(number: 4)
                    CallButtonView(number: 5)
                    CallButtonView(number: 6)
                }//buttons - second line
                
                HStack{
                    CallButtonView(number: 7)
                    CallButtonView(number: 8)
                    CallButtonView(number: 9)
                }//buttons - third line
                
                HStack{
                    UselessButtonView(buttonImage: "asterisk")
                    CallButtonView(number: 0)
                    UselessButtonView(buttonImage: "hashtag")
                }//buttons - fourth line
                
                HStack{
                    EndCallbuttonView()
                }
                .padding()
                
            }

        }
        .background(Color(.black))
        //main Zstack
    }
}


struct PreviewCallView_Previews: PreviewProvider {
    static var previews: some View {
        PreviewCallView()
//.previewInterfaceOrientation(.portrait)
//            .previewLayout(.device)
//            .previewInterfaceOrientation(.portrait)
    }
}
