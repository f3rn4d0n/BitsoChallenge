//
//  GetArtistDataSourceType.swift
//  BitsoChallenge
//
//  Created by Luis Fernando Bustos Ramírez on 12/02/24.
//

import Foundation

protocol GetArtistUseCaseType {
    func execute(artistId: Int) async -> Result<Artist, Error>
}

struct GetArtistUseCase: GetArtistUseCaseType {
    
    let remoteDataSource: ArtworkRemoteDataSourceType
    
    init(remoteDataSource: ArtworkRemoteDataSourceType) {
        self.remoteDataSource = remoteDataSource
    }
    
    func execute(artistId: Int) async -> Result<Artist, Error> {
        do {
            return try await .success(remoteDataSource.getArtist(id: artistId))
        } catch {
            return .failure(error)
        }
    }
}
