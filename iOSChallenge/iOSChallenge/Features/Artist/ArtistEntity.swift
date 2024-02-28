//
//  ArtistEntity.swift
//  iOSChallenge
//
//  Created by Luis Fernando Bustos Ramírez on 12/02/24.
//

import Foundation
import iOSChallengeEntities

enum ArtistRouterEntity: Equatable, Hashable {
}

struct ArtistViewEntity {
    var artworkTitle: String
    var artworkImage: String?
    var artworkDate: String?
    var artworkDetail: String
    var artworkAuthor: String?
    var artistBorn: String?
    var artistAltNames: String?
    var artistDetail: String?
    var isLoading = false
    var error: ErrorDetail? = nil
    
    init(artwork: Artwork) {
        self.artworkTitle = artwork.title
        self.artworkImage = artwork.image
        self.artworkDate = artwork.date
        self.artworkDetail = artwork.description
        self.artworkAuthor = artwork.artist
        self.artistBorn = nil
        self.artistAltNames = nil
        self.artistDetail = nil
    }
    
    init(artwork: Artwork, artist: Artist) {
        self.artworkTitle = artwork.title
        self.artworkImage = artwork.image
        self.artworkDate = artwork.date
        self.artworkDetail = artwork.description
        self.artworkAuthor = artwork.artist
        self.artistBorn = artist.lifePeriod
        self.artistAltNames = artist.altNames
        self.artistDetail = artist.description
    }
    
    var artworkDetailNotEmpty: Bool {
        return artistDetail != nil || artistAltNames != nil || artistBorn != nil
    }
}
