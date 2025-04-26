//
//  SongDetailsViewModel.swift
//  SongDetails
//
//  Created by İhsan Akbay on 26.04.2025.
//

import AnalyticsInterface
import CommonModels
import Foundation

final class SongDetailsViewModel {
    private let song: Song
    private let analyticsTracker: AnalyticsEventTracking
    private let onGoToArtistTapped: (String) -> Void

    init(song: Song, analyticsTracker: AnalyticsEventTracking, onGoToArtistTapped: @escaping (String) -> Void) {
        self.song = song
        self.analyticsTracker = analyticsTracker
        self.onGoToArtistTapped = onGoToArtistTapped
    }

    func name() -> String {
        song.name
    }

    func artistName() -> String {
        song.artistName
    }

    func lyrics() -> String {
        song.lyrics
    }

    // MARK: - Actions

    func didTapGoToArtist() {
        analyticsTracker.trackEvent(.init(name: SongDetailsEventNames.artistTappedFromSongDetail))
        onGoToArtistTapped(song.artistIdentifier)
    }
}
