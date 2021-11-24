//
//  Calling.swift
//  b.hind
//
//  Created by HANNA P C FERREIRA on 23/11/21.
//

import SwiftUI

struct Calling: View {
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
     
                    Text("Unkown Caller")
                        .foregroundColor(.white)
                        .font(.system(size: 34, weight: .regular))
                        .padding()
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
    }
}

struct Calling_Previews: PreviewProvider {
    static var previews: some View {
        Calling()
    }
}
