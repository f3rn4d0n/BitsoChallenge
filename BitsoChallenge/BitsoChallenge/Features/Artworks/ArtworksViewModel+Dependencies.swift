//
//  ArtworksViewModel+Dependencies.swift
//  BitsoChallenge
//
//  Created by Luis Fernando Bustos Ramírez on 08/02/24.
//

import SwiftUI

struct ArtworksDependencies {

    let useCase: GetArtworksUseCaseType
    
    init(useCase: GetArtworksUseCaseType) {
        self.useCase = useCase
    }
}

protocol ArtworksViewModelType: ObservableObject {
    
    func download(currentArtwork artwork: Artwork?) async throws -> Void
}
