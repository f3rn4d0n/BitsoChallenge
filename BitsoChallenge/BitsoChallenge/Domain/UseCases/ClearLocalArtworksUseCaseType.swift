//
//  ClearLocalArtworksUseCaseType.swift
//  BitsoChallenge
//
//  Created by Luis Fernando Bustos Ramírez on 13/02/24.
//

import Foundation

protocol ClearLocalArtworksUseCaseType {
    func execute() async -> Result<Void, Error>
}

struct ClearLocalArtworksUseCase: ClearLocalArtworksUseCaseType {
    
    let localDataSource: ArtworkLocalDataSourceType
    
    init(localDataSource: ArtworkLocalDataSourceType) {
        self.localDataSource = localDataSource
    }
    
    func execute() async -> Result<Void, Error> {
        do {
            return try await .success(localDataSource.clear())
        } catch {
            return .failure(error)
        }
    }
}
