//
//  GetLocalArtworksUseCaseType.swift
//  BitsoChallenge
//
//  Created by Luis Fernando Bustos Ramírez on 13/02/24.
//

import Foundation
import BitsoChallengeData
import BitsoChallengeEntities

public protocol GetLocalArtworksUseCaseType {
    func execute() async -> Result<ArtworksList, Error>
}

public struct GetLocalArtworksUseCase: GetLocalArtworksUseCaseType {
    
    private let localDataSource: ArtworkLocalDataSourceType
    
    public init(localDataSource: ArtworkLocalDataSourceType) {
        self.localDataSource = localDataSource
    }
    
    public func execute() async -> Result<ArtworksList, Error> {
        do {
            return try await .success(localDataSource.getArtworks())
        } catch {
            return .failure(error)
        }
    }
}
