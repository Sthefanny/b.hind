//
//  bhindApp.swift
//  b.hind
//
//  Created by Sthefanny Gonzaga on 10/11/21.
//

import SwiftUI
import UIKit
import Firebase


class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions:
   [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

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


