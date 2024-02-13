//
//  Artwork.swift
//  BitsoChallenge
//
//  Created by Luis Fernando Bustos Ramírez on 08/02/24.
//

import Foundation

struct Artwork: Hashable, Identifiable, Codable {
    let id: Int
    let title: String
    let description: String
    let date: String?
    let image: String?
    let thumbnail: String?
    let artist: String?
    let artistId: Int?
}
