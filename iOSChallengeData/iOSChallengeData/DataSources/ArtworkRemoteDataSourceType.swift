//
//  ArtworkRemoteDataSourceType.swift
//  iOSChallenge
//
//  Created by Luis Fernando Bustos Ramírez on 08/02/24.
//

import Foundation
import iOSChallengeEntities

public protocol ArtworkRemoteDataSourceType {
    
    func getArtworks(page: Int, limit: Int) async throws -> ArtworksList
    func getArtist(id: Int) async throws -> Artist
}
