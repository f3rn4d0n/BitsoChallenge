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
    
    public init(id: Int, title: String, description: String, date: String?, image: String?, thumbnail: String?, artist: String?, artistId: Int?) {
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
