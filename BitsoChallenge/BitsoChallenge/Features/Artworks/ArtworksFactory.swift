//
//  ArtworksFactory.swift
//  BitsoChallenge
//
//  Created by Luis Fernando Bustos Ramírez on 08/02/24.
//

import SwiftUI
import BitsoChallengeDomain
import BitsoChallengeData

struct ArtworksFactory {
    
    static func makeArtworks() -> some View {
        
        let localDataSource = ArtworksLocalApi(container: BitsoChallengeApp().sharedModelContainer)
        let getRemoteUseCase = GetArtworksUseCase(remoteDataSource: ArtworksApi.shared)
        let saveLocalUseCase = SaveLocalArtworksUseCase(localDataSource: localDataSource)
        let clearLocalUseCase = ClearLocalArtworksUseCase(localDataSource: localDataSource)
        let getAndSaveUseCase = GetAndSaveArtworksUseCase(
            getUseCase: getRemoteUseCase,
            saveUseCase: saveLocalUseCase
        )
        let getLocalUseCase = GetLocalArtworksUseCase(localDataSource: localDataSource)
        let validateDownloadUseCase = ValidateSmoothDownloadNeededUseCase()
        
        let dependencies = ArtworksDependencies(
            getArtworksUseCase: getAndSaveUseCase,
            getLocalUseCase: getLocalUseCase,
            clearLocalUseCase: clearLocalUseCase,
            validateDownloadNeededUseCase: validateDownloadUseCase
        )
        
        let viewModel = ArtworksViewModel(dependencies: dependencies)
        
        return ArtworksView(
            router: ArtworksRouter(),
            viewModel: viewModel
        )
    }
}
