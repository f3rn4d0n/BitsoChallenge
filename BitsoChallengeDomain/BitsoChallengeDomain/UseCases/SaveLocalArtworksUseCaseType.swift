//
//  SaveLocalArtworksUseCaseType.swift
//  BitsoChallenge
//
//  Created by Luis Fernando Bustos Ramírez on 13/02/24.
//

import Foundation
import BitsoChallengeData
import BitsoChallengeEntities

public protocol SaveLocalArtworksUseCaseType {
    func execute(artwoks: [Artwork], currentPage: Int, totalPages: Int) async -> Result<Void, Error>
}

public struct SaveLocalArtworksUseCase: SaveLocalArtworksUseCaseType {
    
    private let localDataSource: ArtworkLocalDataSourceType
    
    public init(localDataSource: ArtworkLocalDataSourceType) {
        self.localDataSource = localDataSource
    }
    
    public func execute(artwoks: [Artwork], currentPage: Int, totalPages: Int) async -> Result<Void, Error> {
        do {
            return try await .success(
                localDataSource.saveArtworks(artwoks, currentPage: currentPage, totalPages: totalPages)
            )
        } catch {
            return .failure(error)
        }
    }
}
