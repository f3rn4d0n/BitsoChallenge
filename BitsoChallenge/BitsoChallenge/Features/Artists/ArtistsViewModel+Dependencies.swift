//
//  ArtistsViewModel+Dependencies.swift
//  BitsoChallenge
//
//  Created by Luis Fernando Bustos Ramírez on 08/02/24.
//

import SwiftUI

struct ArtistsDependencies {

    let useCase: GetArtworksUseCaseType
    
    init(useCase: GetArtworksUseCaseType) {
        self.useCase = useCase
    }
}

protocol ArtistsViewModelType: ObservableObject {
    
    func download(currentArtist artist: Artist?) async throws -> Void
}
