//
//  ArtworksList.swift
//  iOSChallenge
//
//  Created by Luis Fernando Bustos Ramírez on 12/02/24.
//

import Foundation

public struct ArtworksList: Codable {
    public let currentPage: Int
    public let totalPage: Int
    public var artworks: [Artwork]
    
    public init(currentPage: Int, totalPage: Int, artworks: [Artwork]) {
        self.currentPage = currentPage
        self.totalPage = totalPage
        self.artworks = artworks
    }
}
