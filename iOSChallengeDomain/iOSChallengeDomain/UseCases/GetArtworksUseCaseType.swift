//
//  GetArtworksUseCaseType.swift
//  iOSChallenge
//
//  Created by Luis Fernando Bustos Ramírez on 12/02/24.
//

import Foundation
import iOSChallengeData
import iOSChallengeEntities

public protocol GetArtworksUseCaseType {
    func execute(page: Int?) async -> Result<ArtworksList, Error>
}

public struct GetArtworksUseCase: GetArtworksUseCaseType {
    
    private let remoteDataSource: ArtworkRemoteDataSourceType
    
    public init(remoteDataSource: ArtworkRemoteDataSourceType) {
        self.remoteDataSource = remoteDataSource
    }
    
    public func execute(page: Int? = nil) async -> Result<ArtworksList, Error> {
        do {
            return try await .success(remoteDataSource.getArtworks(page: page ?? 1, limit: 20))
        } catch {
            return .failure(error)
        }
    }
}
