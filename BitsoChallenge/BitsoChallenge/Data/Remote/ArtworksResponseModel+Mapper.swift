//
//  ArtworksResponseModel+Mapper.swift
//  BitsoChallenge
//
//  Created by Luis Fernando Bustos Ramírez on 12/02/24.
//

import Foundation

extension ArtworksResponseModel {
    
    func mapToArtworks() -> [Artwork] {
        return self.data.map{ $0.mapToArtwork()}
    }
}

extension ArtworkData {
    func mapToArtwork() -> Artwork {
        return .init(
            id: self.id,
            title: self.title,
            description: self.description ?? "",
            image: String(format: ApiConstants.imageTumbleUrl, arguments: [self.imageId]),
            artist: self.artistTitle,
            artistId: self.artistId
        )
    }
}

extension ArtistResponseModel {
    
    func mapToArtist() -> Artist {
        return Artist()
    }
}
