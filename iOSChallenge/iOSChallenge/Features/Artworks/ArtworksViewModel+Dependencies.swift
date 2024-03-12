//
//  ArtworksViewModel+Dependencies.swift
//  iOSChallenge
//
//  Created by Luis Fernando Bustos Ramírez on 08/02/24.
//

import SwiftUI
import iOSChallengeEntities
import iOSChallengeDomain

struct ArtworksDependencies {

    let getArtworksUseCase: GetAndSaveArtworksUseCaseType
    let getLocalUseCase: GetLocalArtworksUseCaseType
    let clearLocalUseCase: ClearLocalArtworksUseCaseType
    let validateDownloadNeededUseCase: ValidateDownloadNeededType
    
    init(getArtworksUseCase: GetAndSaveArtworksUseCaseType,
         getLocalUseCase: GetLocalArtworksUseCaseType,
         clearLocalUseCase: ClearLocalArtworksUseCaseType,
         validateDownloadNeededUseCase: ValidateDownloadNeededType) {
        self.getArtworksUseCase = getArtworksUseCase
        self.getLocalUseCase = getLocalUseCase
        self.clearLocalUseCase = clearLocalUseCase
        self.validateDownloadNeededUseCase = validateDownloadNeededUseCase
    }
}

protocol ArtworksViewModelType: ObservableObject {
    
    func downloadArtworks(current artwork: Artwork) async
    func reloadArtworks() async
    func requestLocalArtworks() async
    func clearDataBase() async
}
