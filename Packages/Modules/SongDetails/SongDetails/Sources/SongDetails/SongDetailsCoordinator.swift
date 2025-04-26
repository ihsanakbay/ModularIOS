//
//  SongDetailsCoordinator.swift
//  SongDetails
//
//  Created by İhsan Akbay on 26.04.2025.
//

import AnalyticsInterface
import ArtistDetailInterface
import CommonModels
import DependencyContainer
import SwiftUI

final class SongDetailsCoordinator {
    private weak var navigationController: UINavigationController?

    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }

    @MainActor
    func makeViewController(with song: Song) -> UIViewController {
        let analyticsTracker = DC.shared.resolve(.singleInstance, for: AnalyticsEventTracking.self)
        let view = SongDetailsView(
            viewModel: .init(
                song: song,
                analyticsTracker: analyticsTracker,
                onGoToArtistTapped: pushArtistDetail(withIdentifier:)
            )
        )
        let hostingVC = UIHostingController(rootView: view)
        hostingVC.title = song.name
        return hostingVC
    }

    @MainActor
    private func pushArtistDetail(withIdentifier id: String) {
        let gateway = DC.shared.resolve(.closureBased, for: ArtistDetailInterface.self)
        let view = gateway.makeArtistDetailModule(
            navigationController: navigationController,
            artistIdentifier: id
        )
        navigationController?.pushViewController(view, animated: true)
    }
}
