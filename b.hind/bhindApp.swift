//
//  bhindApp.swift
//  b.hind
//
//  Created by Sthefanny Gonzaga on 10/11/21.
//

import SwiftUI
import UIKit
import Firebase

@main
struct bhindApp: App {
    let userRepository = UserRepository()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            let showOnboarding = userRepository.getShowOnboardingInfo()
            
            if showOnboarding == true {
                WarningView()
            } else {
                HomeView()
            }
        }
    }
}


