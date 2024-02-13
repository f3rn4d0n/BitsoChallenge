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
        var thumbnail: String? = nil
        if let image = self.imageId {
            imageUrl = String(format: ApiConstants.imageFullUrl, arguments: [image])
            thumbnail = String(format: ApiConstants.imageThumbnailUrl, arguments: [image])
        }
        
        return .init(
            id: self.id,
            title: self.title,
            description: self.mediumDisplay ?? "",
            date: self.dateDisplay,
            image: imageUrl,
            thumbnail: thumbnail,
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
        
        var period: String?
        if let birth = self.birthDate {
            period = "Born at \(birth)"
            if let death = self.deathDate {
                period?.append(contentsOf: ", Death at: \(death)")
            }
        }
        
        var altNames: String?
        for name in self.altTitles ?? [] {
            if altNames?.isEmpty == nil {
                altNames = ""
            }
            altNames?.append("- ")
            altNames?.append(name)
            altNames?.append("\n")
        }
        
        return .init(
            id: self.id,
            title: self.title,
            lifePeriod: period,
            description: self.description,
            altNames: altNames
        )
    }
}
