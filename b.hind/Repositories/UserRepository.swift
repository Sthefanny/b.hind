//
//  UserRepository.swift
//  b.hind
//
//  Created by Sthefanny Gonzaga on 27/11/21.
//

import Foundation

class UserRepository {
    
    func storeIsFirtTimeInfo(isFirstTime: Bool) {
        UserDefaults.standard.set(isFirstTime, forKey: "isFirstTime")
    }
    
    func getIsFirstTimeInfo() -> Bool {
        let isFirstTime = UserDefaults.standard.bool(forKey: "isFirstTime")
        print("isFirstTime == \(isFirstTime)")
        return isFirstTime
    }
    
    func removeIsFirstTimeInfo() {
        UserDefaults.resetStandardUserDefaults()
    }
}
