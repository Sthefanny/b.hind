//
//  bhindApp.swift
//  b.hind
//
//  Created by Sthefanny Gonzaga on 10/11/21.
//

import SwiftUI

@main
struct bhindApp: App {
    let userRepository = UserRepository()
    
    var body: some Scene {
        WindowGroup {
//            let isFirstTime = userRepository.getIsFirstTimeInfo()
//            
//            if isFirstTime == true {
                WarningView()
//            } else {
//                HomeView()
//            }
        }
    }
}


