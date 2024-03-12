//
//  ArtistFactory.swift
//  iOSChallenge
//
//  Created by Luis Fernando Bustos Ramírez on 12/02/24.
//

import SwiftUI
import iOSChallengeEntities
import iOSChallengeDomain
import iOSChallengeData

struct ArtistFactory {
    
    static func makeArtist(path: Binding<NavigationPath>, artwork: Artwork) -> some View {
        
        let dependencies = ArtistDependencies(artwork: artwork, useCase: GetArtistUseCase(remoteDataSource: ArtworksApi()))
        let viewModel = ArtistViewModel(dependencies: dependencies)
        
        return ArtistView(
            router: ArtistRouter(),
            viewModel: viewModel,
            path: path
        )
    }
}
