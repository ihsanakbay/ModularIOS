//
//  ArtistDetailGateway.swift
//  ArtistDetail
//
//  Created by İhsan Akbay on 26.04.2025.
//

import ArtistDetailInterface
import UIKit

public struct ArtistDetailGateway: ArtistDetailInterface {
    public init() {}

    @MainActor
    public func makeArtistDetailModule(
        navigationController: UINavigationController?,
        artistIdentifier: String
    ) -> UIViewController {
        let coordinator = ArtistDetailsCoordinator(navigationController: navigationController)
        return coordinator.makeViewController(artistIdentifier: artistIdentifier)
    }
}
