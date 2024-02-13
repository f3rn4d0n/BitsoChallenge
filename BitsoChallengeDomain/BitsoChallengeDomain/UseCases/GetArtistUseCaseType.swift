//
//  GetArtistDataSourceType.swift
//  BitsoChallenge
//
//  Created by Luis Fernando Bustos Ramírez on 12/02/24.
//

import Foundation
import BitsoChallengeData
import BitsoChallengeEntities

public protocol GetArtistUseCaseType {
    func execute(artistId: Int) async -> Result<Artist, Error>
}

public struct GetArtistUseCase: GetArtistUseCaseType {
    
    private let remoteDataSource: ArtworkRemoteDataSourceType
    
    public init(remoteDataSource: ArtworkRemoteDataSourceType) {
        self.remoteDataSource = remoteDataSource
    }
    
    public func execute(artistId: Int) async -> Result<Artist, Error> {
        do {
            return try await .success(remoteDataSource.getArtist(id: artistId))
        } catch {
            return .failure(error)
        }
    }
}
