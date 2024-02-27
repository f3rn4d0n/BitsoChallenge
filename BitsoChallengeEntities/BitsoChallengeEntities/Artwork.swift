//
//  Artwork.swift
//  BitsoChallenge
//
//  Created by Luis Fernando Bustos Ramírez on 08/02/24.
//

import Foundation

public struct Artwork: Hashable, Identifiable, Codable {
    public let id: Int
    public let title: String
    public let description: String
    public let date: String?
    public let image: String?
    public let thumbnail: String?
    public let artist: String?
    public let artistId: Int?
    
    public init(id: Int = 0, title: String = "", description: String = "", date: String? = nil, image: String? = nil, thumbnail: String? = nil, artist: String? = nil, artistId: Int? = nil) {
        self.id = id
        self.title = title
        self.description = description
        self.date = date
        self.image = image
        self.thumbnail = thumbnail
        self.artist = artist
        self.artistId = artistId
    }
}
