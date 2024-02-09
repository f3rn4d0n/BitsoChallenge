//
//  ArtistsViewModel.swift
//  BitsoChallenge
//
//  Created by Luis Fernando Bustos Ramírez on 08/02/24.
//

import SwiftUI

public final class ArtistsViewModel: ArtistsViewModelType {

    private let dependencies: ArtistsDependencies
    @Published var artists: [Artist] = []

    public init(dependencies: ArtistsDependencies) {
        self.dependencies = dependencies
    }

    func download(currentArtist artist: Artist?) async -> Void {
        return
    }
}
