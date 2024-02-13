//
//  ArtworksDependenciesTest.swift
//  BitsoChallenge
//
//  Created by Luis Fernando Bustos Ramírez on 13/02/24.
//

import Foundation
import BitsoChallengeData
import BitsoChallengeDomain

struct ArtworksDependenciesTest {
    
    static func dependencies() -> ArtworksDependencies {
        let localDataSource = ArtworksLocalApi(container: BitsoChallengeApp().sharedModelContainer)
        let getRemoteUseCase = GetArtworksUseCase(remoteDataSource: ArtworksApi.shared)
        let getLocalUseCase = GetLocalArtworksUseCase(localDataSource: localDataSource)
        let saveLocalUseCase = SaveLocalArtworksUseCase(localDataSource: localDataSource)
        let clearLocalUseCase = ClearLocalArtworksUseCase(localDataSource: localDataSource)
        
        return ArtworksDependencies(
            getRemoteUseCase: getRemoteUseCase,
            getLocalUseCase: getLocalUseCase,
            saveLocalUseCase: saveLocalUseCase,
            clearLocalUseCase: clearLocalUseCase
        )
    }
}
