//
//  GetArtworksUseCaseType.swift
//  BitsoChallenge
//
//  Created by Luis Fernando Bustos Ramírez on 12/02/24.
//

import Foundation

protocol GetArtworksUseCaseType {
    func execute(page: Int?) async -> Result<ArtworksList, Error>
}

struct GetArtworksUseCase: GetArtworksUseCaseType {
    
    let remoteDataSource: ArtworkRemoteDataSourceType
    
    init(remoteDataSource: ArtworkRemoteDataSourceType) {
        self.remoteDataSource = remoteDataSource
    }
    
    func execute(page: Int? = nil) async -> Result<ArtworksList, Error> {
        do {
            return try await .success(remoteDataSource.getArtworks(page: page ?? 1, limit: 20))
        } catch {
            return .failure(error)
        }
    }
}
