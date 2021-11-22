//
// Created by Sthefanny Gonzaga on 22/11/21.
//

import SwiftUI

struct HomeView : View {
    var body: some View {
        return ZStack {
            GeometryReader { geo in
                Text("TESTE 2")
            }
                    .edgesIgnoringSafeArea(.all)
        }
    }
}

struct HomeView_Previews : PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
