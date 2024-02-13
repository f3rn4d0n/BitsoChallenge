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
    
    func download(currentArtwork artwork: Artwork?) async -> Void {
        rebootDownloadsIfNeeded(artwork: artwork)
        if needSmoothDownloadin(artwork: artwork) {
            DispatchQueue.main.async { [weak self] in
                self?.isLoading = true
            }
            let artworksList = await dependencies.useCase.execute(page: currentPage + 1)
            DispatchQueue.main.async { [weak self] in
                switch artworksList {
                case .success(let success):
                    self?.currentPage = success.currentPage
                    self?.totalPages = success.totalPage
                    self?.artworks.append(contentsOf: success.artworks)
                case .failure(let failure):
                    print("Error: \(failure.localizedDescription)")
                }
                self?.isLoading = false
            }
        }
    }
    
    func rebootDownloadsIfNeeded(artwork: Artwork?) {
        if !isLoading && artwork == nil && artworks.count > 0 {
            DispatchQueue.main.async { [weak self] in
                self?.currentPage = 0
                self?.totalPages = 1
                self?.artworks = []
            }
        }
    }
    
    func needSmoothDownloadin(artwork: Artwork?) -> Bool{
        if let art = artwork, let index = artworks.firstIndex(of: art) {
            if artworks.count - index > 5 {
                return false
            }
        }
        return currentPage < totalPages && !isLoading
    }
}
