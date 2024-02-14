//
//  ArtistDependenciesTest.swift
//  BitsoChallenge
//
//  Created by Luis Fernando Bustos Ramírez on 13/02/24.
//

import Foundation
import BitsoChallengeData
import BitsoChallengeDomain

struct ArtistDependenciesTest {
    
    static func dependencies() -> ArtistDependencies {
        
        return .init(
            artwork: .init(id: 1, title: "", description: "", date: nil, image: nil, thumbnail: nil, artist: nil, artistId: nil),
            useCase: GetArtistUseCase(remoteDataSource: ArtworksApi())
        )
    }
}
