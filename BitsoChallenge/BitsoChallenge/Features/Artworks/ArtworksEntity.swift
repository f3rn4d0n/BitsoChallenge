//
//  ArtworksEntity.swift
//  BitsoChallenge
//
//  Created by Luis Fernando Bustos Ramírez on 08/02/24.
//

import Foundation
import BitsoChallengeEntities

enum ArtworksRouterEntity: Equatable, Hashable {
    case detail(artwork: Artwork)
}

struct ArtworksEntity {
    
    var isLoading = false
    var artworks: [Artwork] = []
    var error: ErrorDetail?
}
