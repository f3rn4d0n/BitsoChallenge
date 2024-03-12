//
//  ArtworksEntity.swift
//  iOSChallenge
//
//  Created by Luis Fernando Bustos Ramírez on 08/02/24.
//

import Foundation
import iOSChallengeEntities

enum ArtworksRouterEntity: Equatable, Hashable {
    case detail(artwork: Artwork)
}

struct ArtworksEntity {
    
    var isLoading = false
    var artworks: [Artwork] = []
    var error: ErrorDetail?
}
