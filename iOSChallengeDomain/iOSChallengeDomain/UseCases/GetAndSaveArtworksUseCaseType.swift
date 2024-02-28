//
//  GetAndSaveArtworksUseCaseType.swift
//  iOSChallengeDomain
//
//  Created by Luis Fernando Bustos Ramírez on 14/02/24.
//

import Foundation
import iOSChallengeEntities

public protocol GetAndSaveArtworksUseCaseType {
    
    func execute(currentPage: Int, andSave save: [Artwork]) async -> Result<ArtworksList, Error>
}

public struct GetAndSaveArtworksUseCase: GetAndSaveArtworksUseCaseType {
    
    private let getUseCase: GetArtworksUseCaseType
    private let saveUseCase: SaveLocalArtworksUseCaseType
    
    public init(getUseCase: GetArtworksUseCaseType, saveUseCase: SaveLocalArtworksUseCaseType) {
        self.getUseCase = getUseCase
        self.saveUseCase = saveUseCase
    }
    
    public func execute(currentPage: Int, andSave save: [Artwork]) async -> Result<ArtworksList, Error> {
        let artworksList = await getUseCase.execute(page: currentPage + 1)
        switch artworksList {
        case .success(let success):
            var artworksList = ArtworksList(currentPage: success.currentPage, totalPage: success.totalPage, artworks: save)
            artworksList.artworks.append(contentsOf: success.artworks)
            _ = await saveUseCase.execute(artwoks: artworksList.artworks, currentPage: artworksList.currentPage, totalPages: artworksList.totalPage)
            return .success(artworksList)
        case .failure(let error):
            return .failure(error)
        }
    }
}
