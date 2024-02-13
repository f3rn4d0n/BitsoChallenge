//
//  ArtistViewModel+Dependencies.swift
//  BitsoChallenge
//
//  Created by Luis Fernando Bustos Ramírez on 12/02/24.
//

import SwiftUI
import BitsoChallengeEntities
import BitsoChallengeDomain

struct ArtistDependencies {
    
    let artwork: Artwork
    let useCase: GetArtistUseCaseType

    public init(artwork: Artwork, useCase: GetArtistUseCaseType) {
        self.artwork = artwork
        self.useCase = useCase
    }
}

protocol ArtistViewModelType: ObservableObject {
    
    func getInfo() async -> Void
}
