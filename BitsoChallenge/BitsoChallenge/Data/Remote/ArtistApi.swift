//
//  ArtistApi.swift
//  BitsoChallenge
//
//  Created by Luis Fernando Bustos Ramírez on 12/02/24.
//

import Foundation

struct ArtistApi: ArtistRemoteDataSourceType {
    
    let service: NetworkServiceType
    
    static let shared = ArtistApi()
    
    private init() {
        service = RequestNetworkProvider()
    }
    
    func getArtists(page: Int, limit: Int) async throws -> [Artist] {
        
        let requestModel = ArtistRequestModel(page: page, limit: limit)
        let endpoint = ArtistEndpoint.fetchArtists(model: requestModel)
        
        let artistResponse: ArtistResponseModel = try await service.request(target: endpoint)
        
        return artistResponse.mapToArtist()
    }
    
    func getArtistDetail(artistId: Int) async throws -> ArtistDetail {
        
        let requestModel = ArtistDetailRequestModel(artistId: artistId)
        let endpoint = ArtistEndpoint.detailArtist(model: requestModel)
        
        let artistResponse: ArtistDetailResponseModel = try await service.request(target: endpoint)
        
        return artistResponse.mapToArtist()
    }
}
