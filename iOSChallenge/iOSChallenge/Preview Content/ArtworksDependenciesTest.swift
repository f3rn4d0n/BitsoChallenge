//
//  ArtworksDependenciesTest.swift
//  iOSChallenge
//
//  Created by Luis Fernando Bustos Ramírez on 13/02/24.
//

import Foundation
import iOSChallengeData
import iOSChallengeDomain

struct ArtworksDependenciesTest {
    
    static func dependencies() -> ArtworksDependencies {
        let localDataSource = ArtworksLocalApi(container: iOSChallengeApp().sharedModelContainer)
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
