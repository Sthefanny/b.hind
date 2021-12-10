//
//  Call.swift
//  b.hind
//
//  Created by HANNA P C FERREIRA on 18/11/21.
//

import Foundation
import SwiftUI


struct CallView: View {
    @ObservedObject var call = CallManager.instance
    @StateObject var viewModel = CallViewModel()
    
    @State var enabled = false
    @State var showAction1 = false
    @State var showAction2 = false
    
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
                    CallButtonView(number: 1, sound: .call1, enabled: $enabled, action: {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 38) {
                            showAction1 = true
                        }
                    })
                    CallButtonView(number: 2, sound: .call2, enabled: $enabled, action: {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 6) {
                            showAction2 = true
                        }
                    })
                    CallButtonView(number: 3, sound: .call3, enabled: $enabled, action: {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 28) {
                            enabled = true
                        }
                    })
                }//buttons - first line
                
                HStack{
                    CallButtonView(number: 4, sound: .options, enabled: $enabled, action: {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 19) {
                            enabled = true
                        }
                    })
                    CallButtonView(number: 5, sound: .options, enabled: $enabled, action: {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 49) {
                            enabled = true
                        }
                    })
                    CallButtonView(number: 6, sound: .options, enabled: $enabled, action: {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 49) {
                            enabled = true
                        }
                    })
                }//buttons - second line
                
                HStack{
                    CallButtonView(number: 7, sound: .options, enabled: $enabled, action: {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 49) {
                            enabled = true
                        }
                    })
                    CallButtonView(number: 8, sound: .options, enabled: $enabled, action: {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 49) {
                            enabled = true
                        }
                    })
                    CallButtonView(number: 9, sound: .proposal, enabled: $enabled, action: {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 49) {
                            enabled = true
                        }
                    })
                }//buttons - third line
                
                HStack{
                    UselessButtonView(buttonImage: "asterisk", sound: .options, enabled: $enabled)
                    CallButtonView(number: 0, sound: .options, enabled: $enabled, action: {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 49) {
                            enabled = true
                        }
                    })
                    UselessButtonView(buttonImage: "hashtag", sound: .options, enabled: $enabled)
                }//buttons - fourth line
                
                HStack{
                    EndCallbuttonView()
                }
                .padding()
                
                
                
                if call.shouldGo == true {
                    Text("apareci")
                } else {
                    Text("NÃO apareci")
                }
                
                NavigationLink(destination: HomeView(), isActive: $call.shouldGo) { EmptyView() }
            }

        }
        .background(Color(.black))
        .navigationBarBackButtonHidden(true)
        .navigationBarTitle("")
        .onAppear {
            call.playSound(sound: .call2)
            DispatchQueue.main.asyncAfter(deadline: .now() + 49) {
                enabled = true
            }
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
