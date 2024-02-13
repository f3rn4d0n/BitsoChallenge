//
//  ArtworkRemoteDataSourceType.swift
//  BitsoChallenge
//
//  Created by Luis Fernando Bustos Ramírez on 08/02/24.
//

import Foundation
import BitsoChallengeEntities

public protocol ArtworkRemoteDataSourceType {
    
     func getArtworks(page: Int, limit: Int) async throws -> ArtworksList
     func getArtist(id: Int) async throws -> Artist
}
