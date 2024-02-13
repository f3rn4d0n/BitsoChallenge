//
//  ArtistViewModel.swift
//  BitsoChallenge
//
//  Created by Luis Fernando Bustos Ramírez on 12/02/24.
//

import SwiftUI

final class ArtistViewModel: ArtistViewModelType {
     
    private let dependencies: ArtistDependencies
    var artistEntity: ArtistViewEntity
    

    init(dependencies: ArtistDependencies) {
        self.dependencies = dependencies
        artistEntity = .init(
            artworkTitle: dependencies.artwork.title
        )
    }

    func getInfo() async -> Void {
        if let artistId = dependencies.artwork.artistId {
            let artistResponse = await dependencies.useCase.execute(artistId: artistId)
            switch artistResponse {
            case .success(let success):
                print(success)
            case .failure(let failure):
                print("Error: \(failure.localizedDescription)")
            }
        }
    }
}
