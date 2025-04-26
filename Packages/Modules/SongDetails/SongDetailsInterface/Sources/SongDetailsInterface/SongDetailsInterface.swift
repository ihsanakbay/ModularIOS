import CommonModels
import UIKit

public protocol SongDetailsInterface {
    @MainActor
    func makeSongDetailsModule(navigationController: UINavigationController?, song: Song) -> UIViewController
}
