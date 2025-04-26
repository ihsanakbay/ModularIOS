//
//  Artist.swift
//  ArtistDetail
//
//  Created by İhsan Akbay on 26.04.2025.
//

import CommonModels
import Foundation

struct Artist: Codable, Sendable {
    let name: String
    let birthDate: Date
    let songs: [Song]
}
