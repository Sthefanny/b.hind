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
    let size = UIScreen.main.bounds.size
    
    @State var enabled = false
    @State var showAction1 = false
    @State var showAction2 = false
    @State var actualAction: SoundOption = .proposal
    @State var showMessage = false
    
    var body: some View {
        ZStack (alignment: .center) {
            Image("call_bg")
                .resizable()
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
                        actualAction = .call1
                    })
                    CallButtonView(number: 2, sound: .call2, enabled: $enabled, action: {
                        actualAction = .call2
                    })
                    CallButtonView(number: 3, sound: .call3, enabled: $enabled, action: {
                        actualAction = .call3
                    })
                }//buttons - first line
                
                HStack{
                    CallButtonView(number: 4, sound: .options, enabled: $enabled, action: {
                        actualAction = .options
                    })
                    CallButtonView(number: 5, sound: .options, enabled: $enabled, action: {
                        actualAction = .options
                    })
                    CallButtonView(number: 6, sound: .options, enabled: $enabled, action: {
                        actualAction = .options
                    })
                }//buttons - second line
                
                HStack{
                    CallButtonView(number: 7, sound: .options, enabled: $enabled, action: {
                        actualAction = .options
                    })
                    CallButtonView(number: 8, sound: .options, enabled: $enabled, action: {
                        actualAction = .options
                    })
                    CallButtonView(number: 9, sound: .proposal, enabled: $enabled, action: {
                        actualAction = .proposal
                    })
                }//buttons - third line
                
                HStack{
                    UselessButtonView(buttonImage: "asterisk", sound: .options, enabled: $enabled)
                    CallButtonView(number: 0, sound: .options, enabled: $enabled, action: {
                        actualAction = .options
                    })
                    UselessButtonView(buttonImage: "hashtag", sound: .options, enabled: $enabled)
                }//buttons - fourth line
                
                HStack(){
                    Spacer()
                    EndCallbuttonView(enabled: $enabled)
                        
                    NavigationLink("", destination: MessageView(), isActive: $showMessage)
                    Button(action: {
                        call.stopSound()
                        showMessage = true
                    }){
                        Image("message")
                            .frame(width: 78, height: 78, alignment: .center)
                            .foregroundColor(enabled ? .white : Color("text_disabled_button"))
                            .background(enabled ? Color("number_button") : Color("number_disabled_button"))
                            .clipShape(Circle())
                    }
                }
                .padding()
                .padding(.trailing, 20)
                
                NavigationLink("", destination: HomeView(), isActive: $showAction1)
                
                NavigationLink("", destination: GameOverVersion1View(), isActive: $showAction2)
            }
            
        }
        .ignoresSafeArea()
        .background(Color(.black))
        .navigationBarBackButtonHidden(true)
        .navigationBarTitle("")
        .navigationBarItems(trailing: SkipButtonView())
        .onAppear {
            call.playSound(sound: .proposal)
            
            actionListener()
            
            AnalyticsService().setView(name: CallView.self)
        }
        //main Zstack
    }
    
    func actionListener() {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { timer in
            if call.hasFinished {
                switch actualAction {
                case .proposal:
                    enabled = call.hasFinished
                case .call1:
                    timer.invalidate()
                    showAction1 = call.hasFinished
                case .call2:
                    timer.invalidate()
                    showAction2 = call.hasFinished
                default:
                    enabled = call.hasFinished
                }
            }
        })
    }
}


struct PreviewCallView_Previews: PreviewProvider {
    static var previews: some View {
        CallView()
    }
}
