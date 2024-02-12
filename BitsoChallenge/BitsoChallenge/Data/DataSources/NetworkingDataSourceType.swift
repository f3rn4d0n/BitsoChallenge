//
//  NetworkingDataSourceType.swift
//  BitsoChallenge
//
//  Created by Luis Fernando Bustos Ramírez on 08/02/24.
//

import Foundation

 protocol ArtistRemoteDataSourceType {
    
     func getArtists(page: Int, limit: Int) async throws -> [Artist]
     func getArtistDetail(artistId: Int) async throws -> ArtistDetail
}
