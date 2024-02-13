//
//  ArtistViewModel.swift
//  BitsoChallenge
//
//  Created by Luis Fernando Bustos Ramírez on 12/02/24.
//

import SwiftUI

final class ArtistViewModel: ArtistViewModelType {
     
    @Published var artistEntity: ArtistViewEntity
    private let dependencies: ArtistDependencies
    
    init(dependencies: ArtistDependencies) {
        self.dependencies = dependencies
        artistEntity =  .init(artwork: dependencies.artwork)
    }

    func getInfo() async -> Void {
        if let artistId = dependencies.artwork.artistId {
            let artistResponse = await dependencies.useCase.execute(artistId: artistId)
            switch artistResponse {
            case .success(let artist):
                DispatchQueue.main.async { [weak self] in
                    guard let self = self else {
                        return
                    }
                    self.artistEntity = .init(artwork: self.dependencies.artwork, artist: artist)
                }
            case .failure(let failure):
                print("Error: \(failure.localizedDescription)")
            }
        }
    }
}
