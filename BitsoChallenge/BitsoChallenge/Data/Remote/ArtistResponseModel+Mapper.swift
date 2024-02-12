//
//  ArtistResponseModel+Mapper.swift
//  BitsoChallenge
//
//  Created by Luis Fernando Bustos Ramírez on 12/02/24.
//

import Foundation

extension ArtistResponseModel {
    
    func mapToArtist() -> [Artist] {
        return self.data.map{ $0.mapToArtist()}
    }
}

extension ArtworksData {
    func mapToArtist() -> Artist {
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

extension ArtistDetailResponseModel {
    
    func mapToArtist() -> ArtistDetail {
        return ArtistDetail()
    }
}
