//
//  ArtworksLocalApi.swift
//  iOSChallenge
//
//  Created by Luis Fernando Bustos Ramírez on 13/02/24.
//

import Foundation
import SwiftData
import iOSChallengeEntities

public actor ArtworksLocalApi: ArtworkLocalDataSourceType, ModelActor {
    
    private var modelContext: ModelContext { modelExecutor.modelContext }
    public let modelContainer: ModelContainer
    public let modelExecutor: any ModelExecutor
    
    public init(container: ModelContainer) {
        self.modelContainer = container
        let context = ModelContext(modelContainer)
        modelExecutor = DefaultSerialModelExecutor(modelContext: context)
    }
    
    public func getArtworks() async throws -> ArtworksList {
        let fetchDescriptor = FetchDescriptor<ArtworksLocalModel>()
        let list: [ArtworksLocalModel] = try modelContext.fetch(fetchDescriptor)
        if let artworksList = list.first?.artworkList {
            return artworksList
        } else {
            throw LocalDataError.dataNotFound
        }
    }
    
    public func saveArtworks(_ artworks: [Artwork], currentPage: Int, totalPages: Int) async throws {
        let artworkList = ArtworksList(currentPage: currentPage, totalPage: totalPages, artworks: artworks)
        try await self.clear()
        modelContext.insert(ArtworksLocalModel.init(artworkList: artworkList))
        try modelContext.save()
    }
    
    public func clear() async throws -> Void {
        try modelContext.delete(model: ArtworksLocalModel.self)
    }
}
