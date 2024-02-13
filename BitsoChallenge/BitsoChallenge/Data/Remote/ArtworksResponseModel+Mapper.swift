//
//  ArtworksResponseModel+Mapper.swift
//  BitsoChallenge
//
//  Created by Luis Fernando Bustos Ramírez on 12/02/24.
//

import Foundation

extension ArtworksResponseModel {
    
    func mapToArtworks() -> ArtworksList {
        return .init(
            currentPage: self.pagination.currentPage,
            totalPage: self.pagination.totalPages,
            artworks: self.data.map{ $0.mapToArtwork()}
        )
    }
}

extension ArtworkData {
    func mapToArtwork() -> Artwork {
        var imageUrl: String?  = nil
        if let image = self.imageId {
            imageUrl = String(format: ApiConstants.imageTumbleUrl, arguments: [image])
        }
        
        return .init(
            id: self.id,
            title: self.title,
            description: self.description ?? "",
            image: imageUrl,
            artist: self.artistTitle,
            artistId: self.artistId
        )
    }
}

extension ArtistResponseModel {
    
    func mapToArtist() -> Artist {
        return self.data.mapToArtist()
    }
}

extension ArtistData {
    
    func mapToArtist() -> Artist {
        
        var period = ""
        if let birth = self.birthDate {
            period = "\(birth)"
            if let death = self.deathDate {
                period.append(contentsOf: ", \(death)")
            }
        }
        
        return .init(
            id: self.id,
            title: self.title,
            lifePeriod: period,
            description: self.description)
    }
}
