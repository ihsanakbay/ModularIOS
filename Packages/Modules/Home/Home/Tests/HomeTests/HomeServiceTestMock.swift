//
//  HomeServiceTestMock.swift
//  Home
//
//  Created by İhsan Akbay on 26.04.2025.
//

import CommonModels
import Foundation
@testable import Home
import XCTest

final class HomeServiceTestMock: HomeServing {
    var fetchSongsExpectation: XCTestExpectation?

    func fetchSongs() async -> [Song] {
        fetchSongsExpectation?.fulfill()
        return [.init(id: "1", name: "test", artistName: "test", artistIdentifier: "1", lyrics: "test")]
    }
}
