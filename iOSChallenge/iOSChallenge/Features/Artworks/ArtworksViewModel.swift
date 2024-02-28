//
//  ArtworksViewModel.swift
//  iOSChallenge
//
//  Created by Luis Fernando Bustos Ramírez on 08/02/24.
//

import SwiftUI
import iOSChallengeEntities

public final class ArtworksViewModel: ArtworksViewModelType {
    
    private let dependencies: ArtworksDependencies
    private var totalPages = 1
    private var currentPage = 0
    @Published var model = ArtworksEntity()
    
    init(dependencies: ArtworksDependencies) {
        self.dependencies = dependencies
    }
    
    func downloadArtworks(current artwork: iOSChallengeEntities.Artwork) async {
        let downloadNeeded = dependencies.validateDownloadNeededUseCase.execute(
            artwork: artwork,
            in: model.artworks,
            isLoading: model.isLoading,
            currentPage: currentPage,
            totalPages: totalPages
        )
        if downloadNeeded {
            await downloadArtworks(currentPage: currentPage, currentArtworks: model.artworks)
        }
    }
    
    func reloadArtworks() async {
        if !model.isLoading {
            await downloadArtworks(currentPage: 0, currentArtworks: [])
        }
    }
    
    func requestLocalArtworks() async {
        clearError()
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
        clearError()
        await _ = dependencies.clearLocalUseCase.execute()
        updatePresetationData(artworkList: .init(currentPage: 0, totalPage: 1, artworks: []))
    }
    
    private func downloadArtworks(currentPage: Int, currentArtworks: [Artwork]) async {
        changeLoading(state: true)
        clearError()
        let artworksListResponse = await dependencies.getArtworksUseCase.execute(currentPage: currentPage, andSave: currentArtworks)
        switch artworksListResponse {
        case .success(let artworkList):
            updatePresetationData(artworkList: artworkList)
            changeLoading(state: false)
        case .failure(let failure):
            updateError(error: failure, currentPage: currentPage, currentArtworks: currentArtworks)
            changeLoading(state: false)
        }
    }
    
    private func updatePresetationData(artworkList: ArtworksList) {
        DispatchQueue.main.async { [weak self] in
            self?.currentPage = artworkList.currentPage
            self?.totalPages = artworkList.totalPage
            self?.model.artworks = artworkList.artworks
        }
    }
    
    private func changeLoading(state: Bool) {
        DispatchQueue.main.async { [weak self] in
            self?.model.isLoading = state
        }
    }
    
    private func updateError(error: Error, currentPage: Int, currentArtworks: [Artwork]) {
        DispatchQueue.main.async { [weak self] in
            self?.model.error = .init(
                title: "Error",
                detail: error.localizedDescription,
                firstAction: ErrorDetailAction(
                    title: "Try again",
                    action: {
                        self?.clearError()
                        await self?.downloadArtworks(currentPage: currentPage, currentArtworks: currentArtworks)
                    }),
                secondAction: ErrorDetailAction(
                    title: "Cancel",
                    action: {
                        self?.clearError()
                    }
                )
            )
        }
    }
    
    private func clearError() {
        DispatchQueue.main.async { [weak self] in
            self?.model.error = nil
        }
    }
}
