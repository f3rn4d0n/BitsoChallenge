//
//  ArtistViewModel+Dependencies.swift
//  BitsoChallenge
//
//  Created by Luis Fernando Bustos Ramírez on 12/02/24.
//

import SwiftUI

struct ArtistDependencies {
    
    let artwork: Artwork

    public init(artwork: Artwork) {
        self.artwork = artwork
    }
}

protocol ArtistViewModelType: ObservableObject {
    
    func getInfo() async -> Void
}
