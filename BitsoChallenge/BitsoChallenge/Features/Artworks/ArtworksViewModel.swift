//
//  ArtworksViewModel.swift
//  BitsoChallenge
//
//  Created by Luis Fernando Bustos Ramírez on 08/02/24.
//

import SwiftUI

public final class ArtworksViewModel: ArtworksViewModelType {
    
    private let dependencies: ArtworksDependencies
    private var totalPages = 1
    private var currentPage = 0
    @Published var isLoading = false
    @Published var artworks: [Artwork] = []
    
    init(dependencies: ArtworksDependencies) {
        self.dependencies = dependencies
    }
    
    func download(currentArtwork artwork: Artwork?) async {
        await rebootDownloadsIfNeeded(artwork: artwork)
        if needSmoothDownloadin(artwork: artwork) {
            DispatchQueue.main.async { [weak self] in
                self?.isLoading = true
            }
            let artworksList = await dependencies.getRemoteUseCase.execute(page: currentPage + 1)
            switch artworksList {
            case .success(let success):
                DispatchQueue.main.async { [weak self] in
                    self?.currentPage = success.currentPage
                    self?.totalPages = success.totalPage
                    self?.artworks.append(contentsOf: success.artworks)
                    Task {
                        await self?.saveArtworks()
                    }
                }
            case .failure(let failure):
                print("Error: \(failure.localizedDescription)")
            }
            DispatchQueue.main.async { [weak self] in
                self?.isLoading = false
            }
        }
    }
    
    func requestLocalArtworks() async {
        let getLocalResponse = await dependencies.getLocalUseCase.execute()
        DispatchQueue.main.async { [weak self] in
            switch getLocalResponse {
            case .success(let success):
                self?.currentPage = success.currentPage
                self?.totalPages = success.totalPage
                self?.artworks = success.artworks
            case .failure(let failure):
                print("Error: \(failure.localizedDescription)")
            }
        }
    }
    
    private func saveArtworks() async {
        _ = await dependencies.saveLocalUseCase.execute(
            artwoks: artworks,
            currentPage: currentPage,
            totalPages: totalPages
        )
    }
    
    private func rebootDownloadsIfNeeded(artwork: Artwork?) async {
        if !isLoading && artwork == nil && artworks.count > 0 {
            _ = await dependencies.clearLocalUseCase.execute()
            DispatchQueue.main.async { [weak self] in
                self?.currentPage = 0
                self?.totalPages = 1
                self?.artworks = []
            }
        }
    }
    
    private func needSmoothDownloadin(artwork: Artwork?) -> Bool{
        if let art = artwork, let index = artworks.firstIndex(of: art) {
            if artworks.count - index > 5 {
                return false
            }
        }
        return currentPage < totalPages && !isLoading
    }
}
