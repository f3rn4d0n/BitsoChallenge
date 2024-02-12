//
//  ArtworksApi.swift
//  BitsoChallenge
//
//  Created by Luis Fernando Bustos Ramírez on 12/02/24.
//

import Foundation

struct ArtworksApi: ArtworkRemoteDataSourceType {
    
    let service: NetworkServiceType
    
    static let shared = ArtworksApi()
    
    private init() {
        service = RequestNetworkProvider()
    }
    
    func getArtworks(page: Int, limit: Int) async throws -> [Artwork] {
        
        let requestModel = ArtworksRequestModel(page: page, limit: limit)
        let endpoint = ArtworksEndpoint.fetchArtworks(model: requestModel)
        
        let artworksResponse: ArtworksResponseModel = try await service.request(target: endpoint)
        
        return artworksResponse.mapToArtworks()
    }
    
    func getArtist(id: Int) async throws -> Artist {
        
        let requestModel = ArtistRequestModel(artistId: id)
        let endpoint = ArtworksEndpoint.getArtist(model: requestModel)
        
        let artistResponse: ArtistResponseModel = try await service.request(target: endpoint)
        
        return artistResponse.mapToArtist()
    }
}
