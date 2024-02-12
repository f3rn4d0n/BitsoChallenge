//
//  ArtistResponseModel.swift
//  BitsoChallenge
//
//  Created by Luis Fernando Bustos Ramírez on 12/02/24.
//

import Foundation

struct ArtistResponseModel: Decodable {
    let pagination: ArtworksPagination
    let data: [ArtworksData]
}

struct ArtworksPagination: Decodable {
    let total: Int
    let limit: Int
    let offset: Int
    let totalPages: Int
    let currentPage: Int
    let nextUrl: String
}

struct ArtworksData: Decodable {
    let id: Int
    let title: String
    let description: String?
    let artistId: Int
    let artistTitle: String
    let artistDisplay: String
    let imageId: String
}

struct ArtistDetailResponseModel: Decodable {
    
}
