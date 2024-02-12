//
//  ArtistsFactory.swift
//  BitsoChallenge
//
//  Created by Luis Fernando Bustos Ramírez on 08/02/24.
//

import SwiftUI

struct ArtistsFactory {
    
    static func makeArtists() -> some View {
        
        let dependencies = ArtistsDependencies(useCase: GetArtworksUseCase(remoteDataSource: ArtistApi.shared))
        let viewModel = ArtistsViewModel(dependencies: dependencies)
        
        return ArtistsView(
            router: ArtistsRouter(),
            viewModel: viewModel
        )
    }
}
