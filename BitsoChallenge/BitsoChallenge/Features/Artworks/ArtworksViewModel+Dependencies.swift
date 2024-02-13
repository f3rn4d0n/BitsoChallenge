//
//  ArtworksViewModel+Dependencies.swift
//  BitsoChallenge
//
//  Created by Luis Fernando Bustos Ramírez on 08/02/24.
//

import SwiftUI
import BitsoChallengeEntities
import BitsoChallengeDomain

struct ArtworksDependencies {

    let getRemoteUseCase: GetArtworksUseCaseType
    let getLocalUseCase: GetLocalArtworksUseCaseType
    let saveLocalUseCase: SaveLocalArtworksUseCaseType
    let clearLocalUseCase: ClearLocalArtworksUseCaseType
    
    init(getRemoteUseCase: GetArtworksUseCaseType, 
         getLocalUseCase: GetLocalArtworksUseCaseType,
         saveLocalUseCase: SaveLocalArtworksUseCaseType,
         clearLocalUseCase: ClearLocalArtworksUseCaseType) {
        self.getRemoteUseCase = getRemoteUseCase
        self.getLocalUseCase = getLocalUseCase
        self.saveLocalUseCase = saveLocalUseCase
        self.clearLocalUseCase = clearLocalUseCase
    }
}

protocol ArtworksViewModelType: ObservableObject {
    
    func download(currentArtwork artwork: Artwork?) async
    func requestLocalArtworks() async
}
