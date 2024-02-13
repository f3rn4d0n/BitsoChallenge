//
//  GetLocalArtworksUseCaseType.swift
//  BitsoChallenge
//
//  Created by Luis Fernando Bustos Ramírez on 13/02/24.
//

import Foundation

protocol GetLocalArtworksUseCaseType {
    func execute() async -> Result<ArtworksList, Error>
}

struct GetLocalArtworksUseCase: GetLocalArtworksUseCaseType {
    
    let localDataSource: ArtworkLocalDataSourceType
    
    init(localDataSource: ArtworkLocalDataSourceType) {
        self.localDataSource = localDataSource
    }
    
    func execute() async -> Result<ArtworksList, Error> {
        do {
            return try await .success(localDataSource.getArtworks())
        } catch {
            return .failure(error)
        }
    }
}
