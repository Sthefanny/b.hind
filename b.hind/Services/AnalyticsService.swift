//
//  AnalyticsService.swift
//  b.hind
//
//  Created by Sthefanny Gonzaga on 14/12/21.
//

import SwiftUI
import Firebase
import FirebaseAnalytics

class AnalyticsService {
    func setView(name: Any) -> Void {
        Analytics.logEvent(AnalyticsEventScreenView,
                           parameters: [AnalyticsParameterScreenName: "\(name)",
                                       AnalyticsParameterScreenClass: "\(name)"])
    }
}
