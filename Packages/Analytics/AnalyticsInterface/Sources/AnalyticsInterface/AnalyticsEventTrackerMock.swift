//
//  AnalyticsEventTrackerMock.swift
//  AnalyticsInterface
//
//  Created by İhsan Akbay on 26.04.2025.
//

import Foundation

public final class AnalyticsEventTrackerMock: AnalyticsEventTracking {
    public var trackedEvents = [AnalyticsEvent]()

    public init() {}

    public func trackEvent(_ event: AnalyticsEvent) {
        trackedEvents.append(event)
    }
}
