//
//  GetLocalArtworksUseCaseType.swift
//  iOSChallenge
//
//  Created by Luis Fernando Bustos Ramírez on 13/02/24.
//

import Foundation
import iOSChallengeData
import iOSChallengeEntities

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
