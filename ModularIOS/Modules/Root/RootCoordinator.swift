//
//  RootCoordinator.swift
//  ModularIOS
//
//  Created by İhsan Akbay on 26.04.2025.
//

import Home
import UIKit

final class RootCoordinator {
    @MainActor
    func makeInitialView() -> UIViewController {
        let gateway = HomeGateway()
        let homeView = gateway.makeHomeModule()
        let tabBarController = RootTabBarController(viewControllers: [homeView])
        return tabBarController
    }
}
