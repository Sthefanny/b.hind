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
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            WarningView()
        }
    }
}


