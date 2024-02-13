//
//  ClearLocalArtworksUseCaseType.swift
//  BitsoChallenge
//
//  Created by Luis Fernando Bustos Ramírez on 13/02/24.
//

import Foundation
import BitsoChallengeData

public protocol ClearLocalArtworksUseCaseType {
    func execute() async -> Result<Void, Error>
}

public struct ClearLocalArtworksUseCase: ClearLocalArtworksUseCaseType {
    
    private let localDataSource: ArtworkLocalDataSourceType
    
    public init(localDataSource: ArtworkLocalDataSourceType) {
        self.localDataSource = localDataSource
    }
    
    public func execute() async -> Result<Void, Error> {
        do {
            return try await .success(localDataSource.clear())
        } catch {
            return .failure(error)
        }
    }
}
