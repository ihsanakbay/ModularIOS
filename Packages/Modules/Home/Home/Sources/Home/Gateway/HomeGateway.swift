//
//  HomeGateway.swift
//  Home
//
//  Created by İhsan Akbay on 26.04.2025.
//

import UIKit

public struct HomeGateway {
    public init() {}

    @MainActor
    public func makeHomeModule() -> UIViewController {
        let coordinator = HomeCoordinator()
        return coordinator.makeViewController()
    }
}
