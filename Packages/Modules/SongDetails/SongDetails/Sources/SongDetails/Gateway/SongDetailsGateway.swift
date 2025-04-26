//
//  SongDetailsGateway.swift
//  SongDetails
//
//  Created by İhsan Akbay on 26.04.2025.
//

import CommonModels
import SongDetailsInterface
import UIKit

public struct SongDetailsGateway: SongDetailsInterface {
    public init() {}
    
    @MainActor
    public func makeSongDetailsModule(
        navigationController: UINavigationController?,
        song: Song
    ) -> UIViewController {
        let coordinator = SongDetailsCoordinator(navigationController: navigationController)
        return coordinator.makeViewController(with: song)
    }
}
