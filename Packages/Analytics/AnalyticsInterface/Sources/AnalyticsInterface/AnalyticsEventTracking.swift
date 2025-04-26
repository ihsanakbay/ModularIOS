//
//  AnalyticsEventTracking.swift
//  AnalyticsInterface
//
//  Created by İhsan Akbay on 26.04.2025.
//

import Foundation

public protocol AnalyticsEventTracking {
    func trackEvent(_ event: AnalyticsEvent)
}
