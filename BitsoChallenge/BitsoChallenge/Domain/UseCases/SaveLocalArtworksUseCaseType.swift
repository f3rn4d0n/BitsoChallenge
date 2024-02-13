//
//  SaveLocalArtworksUseCaseType.swift
//  BitsoChallenge
//
//  Created by Luis Fernando Bustos Ramírez on 13/02/24.
//

import Foundation

protocol SaveLocalArtworksUseCaseType {
    func execute(artwoks: [Artwork], currentPage: Int, totalPages: Int) async -> Result<Void, Error>
}

struct SaveLocalArtworksUseCase: SaveLocalArtworksUseCaseType {
    
    let localDataSource: ArtworkLocalDataSourceType
    
    init(localDataSource: ArtworkLocalDataSourceType) {
        self.localDataSource = localDataSource
    }
    
    func execute(artwoks: [Artwork], currentPage: Int, totalPages: Int) async -> Result<Void, Error> {
        do {
            return try await .success(
                localDataSource.saveArtworks(artwoks, currentPage: currentPage, totalPages: totalPages)
            )
        } catch {
            return .failure(error)
        }
    }
}
