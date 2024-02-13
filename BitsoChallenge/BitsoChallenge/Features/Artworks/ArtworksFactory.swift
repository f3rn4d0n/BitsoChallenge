//
//  ArtworksFactory.swift
//  BitsoChallenge
//
//  Created by Luis Fernando Bustos Ramírez on 08/02/24.
//

import SwiftUI

struct ArtworksFactory {
    
    static func makeArtworks() -> some View {
        
        let localDataSource = ArtworksLocalApi(container: BitsoChallengeApp().sharedModelContainer)
        let getRemoteUseCase = GetArtworksUseCase(remoteDataSource: ArtworksApi.shared)
        let getLocalUseCase = GetLocalArtworksUseCase(localDataSource: localDataSource)
        let saveLocalUseCase = SaveLocalArtworksUseCase(localDataSource: localDataSource)
        let clearLocalUseCase = ClearLocalArtworksUseCase(localDataSource: localDataSource)
        
        let dependencies = ArtworksDependencies(
            getRemoteUseCase: getRemoteUseCase,
            getLocalUseCase: getLocalUseCase,
            saveLocalUseCase: saveLocalUseCase,
            clearLocalUseCase: clearLocalUseCase
        )
        let viewModel = ArtworksViewModel(dependencies: dependencies)
        
        return ArtworksView(
            router: ArtworksRouter(),
            viewModel: viewModel
        )
    }
}
