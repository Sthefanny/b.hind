//
//  TutorialRepository.swift
//  b.hind
//
//  Created by HANNA P C FERREIRA on 10/12/21.
//

import Foundation

class TutorialRepository {
    
    func setShowTutorial(showTutorial: Bool) {
        UserDefaults.standard.set(showTutorial, forKey: "showTutorial")
    }
    
    func getShowTutorial() -> Bool {
        let showTutorial = UserDefaults.standard.bool(forKey: "showTutorial")
        return showTutorial
    }
    
    func removeShowTutorial() {
        UserDefaults.resetStandardUserDefaults()
    }
}
