//
//  ArtworksViewModel.swift
//  BitsoChallenge
//
//  Created by Luis Fernando Bustos Ramírez on 08/02/24.
//

import SwiftUI

public final class ArtworksViewModel: ArtworksViewModelType {

    private let dependencies: ArtworksDependencies
    @Published var artworks: [Artwork] = []

    init(dependencies: ArtworksDependencies) {
        self.dependencies = dependencies
    }

    func download(currentArtwork artwork: Artwork?) async -> Void {
        artworks = await dependencies.useCase.execute(page: nil)
    }
}
