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
        let mockNetworkinService = MockNetworkProvider()
        let getRemoteUseCase = GetArtworksUseCase(remoteDataSource: ArtworksApi(service: mockNetworkinService))
        let saveLocalUseCase = SaveLocalArtworksUseCase(localDataSource: localDataSource)
        let getAndSaveUseCase = GetAndSaveArtworksUseCase(
            getUseCase: getRemoteUseCase,
            saveUseCase: saveLocalUseCase
        )
        let getLocalUseCase = GetLocalArtworksUseCase(localDataSource: localDataSource)
        let clearLocalUseCase = ClearLocalArtworksUseCase(localDataSource: localDataSource)
        let validateDownloadUseCase = ValidateSmoothDownloadNeededUseCase()
        
        return ArtworksDependencies(
            getArtworksUseCase: getAndSaveUseCase,
            getLocalUseCase: getLocalUseCase,
            clearLocalUseCase: clearLocalUseCase,
            validateDownloadNeededUseCase: validateDownloadUseCase
        )
    }
}
