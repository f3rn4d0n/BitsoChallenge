//
//  ArtworksFactory.swift
//  BitsoChallenge
//
//  Created by Luis Fernando Bustos Ramírez on 08/02/24.
//

import SwiftUI

struct ArtworksFactory {
    
    static func makeArtworks() -> some View {
        
        let dependencies = ArtworksDependencies(useCase: GetArtworksUseCase(remoteDataSource: ArtworksApi.shared))
        let viewModel = ArtworksViewModel(dependencies: dependencies)
        
        return ArtworksView(
            router: ArtworksRouter(),
            viewModel: viewModel
        )
    }
}
