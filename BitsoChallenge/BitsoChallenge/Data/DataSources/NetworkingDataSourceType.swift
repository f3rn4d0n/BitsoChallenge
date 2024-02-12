//
//  ArtworkRemoteDataSourceType.swift
//  BitsoChallenge
//
//  Created by Luis Fernando Bustos Ramírez on 08/02/24.
//

import Foundation

 protocol ArtworkRemoteDataSourceType {
    
     func getArtworks(page: Int, limit: Int) async throws -> [Artwork]
     func getArtist(id: Int) async throws -> Artist
}
