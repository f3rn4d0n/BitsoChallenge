//
//  GetAndSaveArtworksUseCaseTest.swift
//  iOSChallengeDomainTests
//
//  Created by Luis Fernando Bustos Ramírez on 14/02/24.
//

import XCTest
import SwiftData
@testable import iOSChallengeDomain
@testable import iOSChallengeData
@testable import iOSChallengeEntities

final class GetAndSaveArtworksUseCaseTest: XCTestCase {
    
    var getAndSaveUseCase: GetAndSaveArtworksUseCaseType?
    
    override func setUp() {
        super.setUp()
        let mockNetworkingProvider = MockNetworkProvider()
        let mockDataSource = ArtworksApi(service: mockNetworkingProvider)
        let getArtworksUseCase = GetArtworksUseCase(remoteDataSource: mockDataSource)
        
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try! ModelContainer(for: ArtworksLocalModel.self, configurations: config)
        let localDataSource = ArtworksLocalApi(container: container)
        let saveLocalUseCase = SaveLocalArtworksUseCase(localDataSource: localDataSource)
        
        getAndSaveUseCase = GetAndSaveArtworksUseCase(getUseCase: getArtworksUseCase, saveUseCase: saveLocalUseCase)
    }
    
    func testGetAndSaveFromEmptySuccess() async throws {
        let getAndSaveResponse = await getAndSaveUseCase?.execute(currentPage: 0, andSave: [])
        guard case .success(let artworks) = getAndSaveResponse else {
            XCTFail("Artworks should be founded")
            return
        }
        XCTAssertGreaterThan(artworks.artworks.count, 0, "Missing artworks")
    }
    
    func testGetAndSaveWithPreviousDataSuccess() async throws {
        var allArtworks: [Artwork] = []
        for i in 0 ..< 100 {
            allArtworks.append(Artwork(id: i))
        }
        let getAndSaveResponse = await getAndSaveUseCase?.execute(currentPage: 0, andSave: allArtworks)
        guard case .success(let artworks) = getAndSaveResponse else {
            XCTFail("Artworks should be founded")
            return
        }
        XCTAssertGreaterThan(artworks.artworks.count, 100, "Missing artworks")
    }
}
