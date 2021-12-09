//
//  UserRepository.swift
//  b.hind
//
//  Created by Sthefanny Gonzaga on 27/11/21.
//

import Foundation

class UserRepository {
    
    func setShowOnboardingInfo(showOnboarding: Bool) {
        UserDefaults.standard.set(showOnboarding, forKey: "showOnboarding")
    }
    
    func getShowOnboardingInfo() -> Bool {
        let showOnboarding = UserDefaults.standard.bool(forKey: "showOnboarding")
        return showOnboarding
    }
    
    func removeShowOnboardingInfo() {
        UserDefaults.resetStandardUserDefaults()
    }
}
