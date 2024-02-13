//
//  ArtworksResponseModel.swift
//  BitsoChallenge
//
//  Created by Luis Fernando Bustos Ramírez on 12/02/24.
//

import Foundation

struct ArtworksResponseModel: Decodable {
    let pagination: ArtworksPagination
    let data: [ArtworkData]
}

struct ArtworksPagination: Decodable {
    let total: Int
    let limit: Int
    let offset: Int
    let totalPages: Int
    let currentPage: Int
    let nextUrl: String
}

struct ArtworkData: Decodable {
    let id: Int
    let title: String
    let description: String?
    let artistId: Int?
    let artistTitle: String?
    let artistDisplay: String?
    let imageId: String?
}

struct ArtistResponseModel: Decodable {
    let data: ArtistData
}

struct ArtistData: Decodable {
    
    let id: Int
    let title: String
    let birthDate: Int?
    let deathDate: Int?
    let description: String?
}
