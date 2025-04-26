import UIKit

public protocol ArtistDetailInterface {
    @MainActor
    func makeArtistDetailModule(
        navigationController: UINavigationController?,
        artistIdentifier: String
    ) -> UIViewController
}
