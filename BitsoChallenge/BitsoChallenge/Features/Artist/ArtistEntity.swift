//
//  ArtistEntity.swift
//  BitsoChallenge
//
//  Created by Luis Fernando Bustos Ramírez on 12/02/24.
//

import Foundation
import BitsoChallengeEntities

enum ArtistRouterEntity: Equatable, Hashable {
}

struct ArtistViewEntity {
    var artworkTitle: String
    var artworkImage: String?
    var artworkDate: String?
    var artworkDetail: String
    var artistTitle: String?
    var artistBorn: String?
    var artistAltNames: String?
    var artistDetail: String?
    
    init(artwork: Artwork) {
        self.artworkTitle = artwork.title
        self.artworkImage = artwork.image
        self.artworkDate = artwork.date
        self.artistTitle = artwork.artist
        self.artistBorn = nil
        self.artworkDetail = artwork.description
        self.artistAltNames = nil
        self.artistDetail = nil
    }
    
    init(artwork: Artwork, artist: Artist) {
        self.artworkTitle = artwork.title
        self.artworkImage = artwork.image
        self.artworkDate = artwork.date
        self.artistTitle = artist.title
        self.artistBorn = artist.lifePeriod
        self.artworkDetail = artwork.description
        self.artistAltNames = artist.altNames
        self.artistDetail = artist.description
    }
}
