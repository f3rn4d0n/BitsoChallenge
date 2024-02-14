//
//  ArtworksViewModel.swift
//  BitsoChallenge
//
//  Created by Luis Fernando Bustos Ramírez on 08/02/24.
//

import SwiftUI
import BitsoChallengeEntities

public final class ArtworksViewModel: ArtworksViewModelType {
    
    private let dependencies: ArtworksDependencies
    private var totalPages = 1
    private var currentPage = 0
    @Published var isLoading = false
    @Published var artworks: [Artwork] = []
    
    init(dependencies: ArtworksDependencies) {
        self.dependencies = dependencies
    }
    
    func downloadArtworks(current artwork: BitsoChallengeEntities.Artwork) async {
        let downloadNeeded = dependencies.validateDownloadNeededUseCase.execute(
            artwork: artwork,
            in: artworks,
            isLoading: isLoading,
            currentPage: currentPage,
            totalPages: totalPages
        )
        if downloadNeeded {
            await downloadArtworks(currentPage: currentPage, currentArtworks: artworks)
        }
    }
    
    func reloadArtworks() async {
        if !isLoading {
            await downloadArtworks(currentPage: 0, currentArtworks: [])
        }
    }
    
    func requestLocalArtworks() async {
        changeLoading(state: true)
        switch await dependencies.getLocalUseCase.execute() {
        case .success(let artworksList):
            updatePresetationData(artworkList: artworksList)
            changeLoading(state: false)
        case .failure(let failure):
            print("Error: \(failure.localizedDescription)")
            changeLoading(state: false)
        }
    }
    
    func clearDataBase() async {
        await _ = dependencies.clearLocalUseCase.execute()
        updatePresetationData(artworkList: .init(currentPage: 0, totalPage: 1, artworks: []))
    }
    
    private func downloadArtworks(currentPage: Int, currentArtworks: [Artwork]) async {
        changeLoading(state: true)
        let artworksListResponse = await dependencies.getArtworksUseCase.execute(currentPage: currentPage, andSave: currentArtworks)
        switch artworksListResponse {
        case .success(let artworkList):
            updatePresetationData(artworkList: artworkList)
            changeLoading(state: false)
        case .failure(let failure):
            print("Error: \(failure.localizedDescription)")
            changeLoading(state: false)
        }
    }
    
    private func updatePresetationData(artworkList: ArtworksList) {
        DispatchQueue.main.async { [weak self] in
            self?.currentPage = artworkList.currentPage
            self?.totalPages = artworkList.totalPage
            self?.artworks = artworkList.artworks
        }
    }
    
    private func changeLoading(state: Bool) {
        DispatchQueue.main.async { [weak self] in
            self?.isLoading = state
        }
    }
}
