//
//  AnalyticsEvent.swift
//  AnalyticsInterface
//
//  Created by İhsan Akbay on 26.04.2025.
//

import Foundation

public struct AnalyticsEvent {
    public let name: String
    public let parameters: [String : Any]?

    public init(name: String, parameters: [String : Any]? = nil) {
        self.name = name
        self.parameters = parameters
    }
}
