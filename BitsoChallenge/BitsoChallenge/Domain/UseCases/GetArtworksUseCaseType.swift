//
//  GetArtworksUseCaseType.swift
//  BitsoChallenge
//
//  Created by Luis Fernando Bustos Ramírez on 12/02/24.
//

import Foundation

protocol GetArtworksUseCaseType {
    func execute(page: Int?) async -> [Artwork]
}

struct GetArtworksUseCase: GetArtworksUseCaseType {
    
    let remoteDataSource: ArtworkRemoteDataSourceType
    
    init(remoteDataSource: ArtworkRemoteDataSourceType) {
        self.remoteDataSource = remoteDataSource
    }
    
    func execute(page: Int? = nil) async -> [Artwork] {
        do {
            return try await remoteDataSource.getArtworks(page: page ?? 1, limit: 10)
        } catch {
            print("Error fetchuing artworks: \(error)")
            return []
        }
    }
}
