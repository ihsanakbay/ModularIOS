//
//  HomeCoordinator.swift
//  Home
//
//  Created by İhsan Akbay on 26.04.2025.
//

import AnalyticsInterface
import CommonModels
import DependencyContainer
import SongDetailsInterface
import SwiftUI

@MainActor
final class HomeCoordinator {
    private lazy var navigationController: UINavigationController = {
        let navigationController = UINavigationController()
        navigationController.navigationBar.prefersLargeTitles = true
        return navigationController
    }()

    @MainActor
    func makeViewController() -> UIViewController {
        let analyticsTracker = DC.shared.resolve(.singleInstance, for: AnalyticsEventTracking.self)
        let viewModel = HomeViewModel(homeService: HomeService(), analyticsTracker: analyticsTracker, onSongSelected: pushSongDetail(_:))
        let homeView = HomeView(viewModel: viewModel)
        let hostingVC = UIHostingController(rootView: homeView)
        navigationController.setViewControllers([hostingVC], animated: false)
        return navigationController
    }

    @MainActor
    func pushSongDetail(_ song: Song) {
        let gateway = DC.shared.resolve(.closureBased, for: SongDetailsInterface.self)
        let songDetailView = gateway.makeSongDetailsModule(navigationController: navigationController, song: song)
        navigationController.pushViewController(songDetailView, animated: true)
    }
}
