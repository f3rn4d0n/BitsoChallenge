//
//  GetArtworksUseCaseType.swift
//  BitsoChallenge
//
//  Created by Luis Fernando Bustos Ramírez on 12/02/24.
//

import Foundation

protocol GetArtworksUseCaseType {
    func execute(page: Int?) async -> [Artist]
}

struct GetArtworksUseCase: GetArtworksUseCaseType {
    
    let remoteDataSource: ArtistRemoteDataSourceType
    
    init(remoteDataSource: ArtistRemoteDataSourceType) {
        self.remoteDataSource = remoteDataSource
    }
    
    func execute(page: Int? = nil) async -> [Artist] {
        do {
            return try await remoteDataSource.getArtists(page: page ?? 1, limit: 10)
        } catch {
            print("Error fetchuing artworks: \(error)")
            return []
        }
    }
}
