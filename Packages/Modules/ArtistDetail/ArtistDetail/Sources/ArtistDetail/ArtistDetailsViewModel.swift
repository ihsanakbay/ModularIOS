//
//  ArtistDetailsViewModel.swift
//  ArtistDetail
//
//  Created by İhsan Akbay on 26.04.2025.
//

import AnalyticsInterface
import CommonModels
import Foundation

final class ArtistDetailsViewModel: ObservableObject {
    @Published var artist: Artist?

    private let artistService: ArtistServing
    private let analyticsTracker: AnalyticsEventTracking
    private let artistIdentifier: String
    private let onSongSelected: (Song) -> Void
    private var didCallOnAppearForTheFirstTime = false

    private let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy"
        return dateFormatter
    }()

    init(artistService: ArtistServing, analyticsTracker: AnalyticsEventTracking, artistIdentifier: String, onSongSelected: @escaping (Song) -> Void) {
        self.artistService = artistService
        self.analyticsTracker = analyticsTracker
        self.artistIdentifier = artistIdentifier
        self.onSongSelected = onSongSelected
    }

    @MainActor
    func onAppear() {
        guard didCallOnAppearForTheFirstTime == false else {
            return
        }
        didCallOnAppearForTheFirstTime = true
        fetchArtist()
    }

    func didSelectSong(_ song: Song) {
        analyticsTracker.trackEvent(.init(name: ArtistDetailsEventNames.songTappedFromArtistDetail))
        onSongSelected(song)
    }

    func birthDateFormatted() -> String {
        guard let artist else {
            return ""
        }
        return dateFormatter.string(from: artist.birthDate)
    }

    @MainActor
    private func fetchArtist() {
        Task {
            self.artist = await artistService.fetchArtist(withIdentifier: artistIdentifier)
        }
    }
}
