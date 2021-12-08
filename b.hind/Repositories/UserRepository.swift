//
//  UserRepository.swift
//  b.hind
//
//  Created by Sthefanny Gonzaga on 27/11/21.
//

import Foundation

class UserRepository {
    
    func setShowOnboardingInfo(isFirstTime: Bool) {
        UserDefaults.standard.set(isFirstTime, forKey: "showOnboarding")
    }
    
    func getShowOnboardingInfo() -> Bool {
        let isFirstTime = UserDefaults.standard.bool(forKey: "showOnboarding")
        print("isFirstTime == \(isFirstTime)")
        return isFirstTime
    }
    
    func removeShowOnboardingInfo() {
        UserDefaults.resetStandardUserDefaults()
    }
}
