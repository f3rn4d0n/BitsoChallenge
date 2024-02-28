//
//  ArtworksLocalApiTest.swift
//  iOSChallengeDataTests
//
//  Created by Luis Fernando Bustos Ramírez on 14/02/24.
//

import XCTest
import SwiftData
@testable import iOSChallengeData
@testable import iOSChallengeEntities

final class ArtworksLocalDataSourceTest: XCTestCase {
    
    var localDataSource: ArtworkLocalDataSourceType?
    
    override func setUp() {
        super.setUp()
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try! ModelContainer(for: ArtworksLocalModel.self, configurations: config)
        localDataSource = ArtworksLocalApi(container: container)
    }
    
    func testDataSourceThrowsErrorWhenIsEmpty() async {
        do {
            _ = try await localDataSource?.getArtworks()
            XCTFail("Error needs to be thrown")
        } catch {
            XCTAssertEqual(error as! LocalDataError, LocalDataError.dataNotFound, "Throws different error")
        }
    }
    
    func testDataSourceSaveEmtpyArtworkSuccess() async throws {
        let artworks: [Artwork] = []
        try await localDataSource?.saveArtworks(artworks, currentPage: 0, totalPages: 0)
        let local = try await localDataSource?.getArtworks()
        XCTAssertEqual(local!.artworks.count, 0, "Different data saved")
    }
    
    func testDataSourceSaveUniqueArtworkSuccess() async throws {
        let artworks: [Artwork] = [.init(id: 1, title: "title", description: "", date: nil, image: nil, thumbnail: nil, artist: nil, artistId: nil)]
        try await localDataSource?.saveArtworks(artworks, currentPage: 0, totalPages: 0)
        let local = try await localDataSource?.getArtworks()
        XCTAssertEqual(local!.artworks.count, 1, "Different data saved")
    }
    
    func testDataSourceClearSuccess() async throws {
        do {
            try await testDataSourceSaveUniqueArtworkSuccess()
            try await localDataSource?.clear()
            _ = try await localDataSource?.getArtworks()
            XCTFail("Error needs to be thrown")
        } catch {
            XCTAssertEqual(error as! LocalDataError, LocalDataError.dataNotFound, "Throws different error")
        }
    }
}
