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
    private var isLoading = false
    @Published var artworks: [Artwork] = []

    init(dependencies: ArtworksDependencies) {
        self.dependencies = dependencies
    }

    func download(currentArtwork artwork: Artwork?) async -> Void {
        if needSmoothDownloadin(artwork: artwork) {
            isLoading = true
            let artworksList = await dependencies.useCase.execute(page: currentPage + 1)
            switch artworksList {
            case .success(let success):
                DispatchQueue.main.async { [weak self] in
                    self?.currentPage = success.currentPage
                    self?.totalPages = success.totalPage
                    self?.artworks.append(contentsOf: success.artworks)
                }
            case .failure(let failure):
                print("Error: \(failure.localizedDescription)")
            }
            isLoading = false
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
