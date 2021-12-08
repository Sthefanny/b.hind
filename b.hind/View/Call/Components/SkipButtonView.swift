//
//  SkipButtonView.swift
//  b.hind
//
//  Created by Sthefanny Gonzaga on 08/12/21.
//

import SwiftUI
import RealityKit

struct SkipButtonView: View {
    @State private var showConfirm = false
    @State private var showNextPage = false
    
    var body: some View {
        HStack {
            Spacer()
            Button(action: {
                showConfirm = true
            }) {
                Text("Skip >")
                    .font(.custom("JosefinSans-Regular", size: 17))
                    .foregroundColor(.white)
            }
            .padding(.vertical, 10)
            
            NavigationLink(destination: HomeView(), isActive: $showNextPage) {
                EmptyView()
            }
            
        }
        .padding(.top, 30)
        .alert("Are you sure?", isPresented: $showConfirm) {
            Button("Yeap!") {
                CallManager.instance.stopSound()
                showNextPage = true
            }
            Button("Nope", role: .cancel) { }
        }
    }
}

struct SkipButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            SkipButtonView()
        }
    }
}
