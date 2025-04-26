//
//  ArtistDetailsCoordinator.swift
//  ArtistDetail
//
//  Created by İhsan Akbay on 26.04.2025.
//

import AnalyticsInterface
import CommonModels
import DependencyContainer
import Foundation
import SongDetailsInterface
import SwiftUI

final class ArtistDetailsCoordinator {
    private weak var navigationController: UINavigationController?

    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }

    @MainActor
    func makeViewController(artistIdentifier: String) -> UIViewController {
        let analyticsTracker = DC.shared.resolve(.singleInstance, for: AnalyticsEventTracking.self)
        let view = ArtistDetailsView(
            viewModel: .init(
                artistService: ArtistService(),
                analyticsTracker: analyticsTracker,
                artistIdentifier: artistIdentifier,
                onSongSelected: pushSongDetail(_:)
            )
        )
        let hostingVC = UIHostingController(rootView: view)
        return hostingVC
    }

    @MainActor
    func pushSongDetail(_ song: Song) {
        let gateway = DC.shared.resolve(.closureBased, for: SongDetailsInterface.self)
        let songDetailView = gateway.makeSongDetailsModule(
            navigationController: navigationController,
            song: song
        )
        navigationController?.pushViewController(songDetailView, animated: true)
    }
}
