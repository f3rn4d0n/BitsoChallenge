//
//  ArtworksRemoteDataSourceTest.swift
//  BitsoChallengeDataTests
//
//  Created by Luis Fernando Bustos Ramírez on 14/02/24.
//

import XCTest
@testable import BitsoChallengeData
@testable import BitsoChallengeEntities

final class ArtworksRemoteDataSourceTest: XCTestCase {
    
    var remoteDataSource: ArtworkRemoteDataSourceType?
    
    override func setUp() {
        super.setUp()
        let mockNetworkingProvider = MockNetworkProvider()
        remoteDataSource = ArtworksApi(service: mockNetworkingProvider)
    }
    
    func testGetArtist() async throws {
        let artistResponse = try await remoteDataSource?.getArtist(id: 1)
        XCTAssertNotNil(artistResponse, "The artist can't be nil")
    }
    
    func testGetArtworks() async throws {
        let artworksResponse = try await remoteDataSource?.getArtworks(page: 0, limit: 10)
        XCTAssertNotNil(artworksResponse, "Artworks can't be nil")
    }
}
