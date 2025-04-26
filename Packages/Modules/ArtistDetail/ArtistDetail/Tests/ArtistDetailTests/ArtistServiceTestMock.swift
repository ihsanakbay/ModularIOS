//
//  ArtistServiceTestMock.swift
//  ArtistDetail
//
//  Created by İhsan Akbay on 26.04.2025.
//

@testable import ArtistDetail
import XCTest

final class ArtistServiceTestMock: ArtistServing {
    var fetchArtistExpectation: XCTestExpectation?

    func fetchArtist(withIdentifier id: String) async -> Artist {
        fetchArtistExpectation?.fulfill()
        let birthDate = Date(timeIntervalSince1970: 0)
        return .init(name: "test", birthDate: birthDate, songs: [.init(id: "1", name: "test", artistName: "test", artistIdentifier: "1", lyrics: "test")])
    }
}
