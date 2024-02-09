//
//  ArtistsViewModel+Dependencies.swift
//  BitsoChallenge
//
//  Created by Luis Fernando Bustos Ramírez on 08/02/24.
//

import SwiftUI

public struct ArtistsDependencies { 

    public init() { }
}

protocol ArtistsViewModelType: ObservableObject {
    
    func download(currentArtist artist: Artist?) async throws -> Void
}
