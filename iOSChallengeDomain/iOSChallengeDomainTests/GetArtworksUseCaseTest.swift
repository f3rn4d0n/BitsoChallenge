//
//  GetArtworksUseCaseTest.swift
//  iOSChallengeDomainTests
//
//  Created by Luis Fernando Bustos Ramírez on 14/02/24.
//

import XCTest
@testable import iOSChallengeDomain
@testable import iOSChallengeData

final class GetArtworksUseCaseTest: XCTestCase {
    
    var getArtworksUseCase: GetArtworksUseCaseType?
    
    override func setUp() {
        super.setUp()
        let mockNetworkingProvider = MockNetworkProvider()
        let mockDataSource = ArtworksApi(service: mockNetworkingProvider)
        getArtworksUseCase = GetArtworksUseCase(remoteDataSource: mockDataSource)
    }
    
    func testGetArtworks() async throws {
        let artworksResponse = await getArtworksUseCase?.execute(page: nil)
        guard case .success(let artworks) = artworksResponse else {
            XCTFail("Artworks not found")
            return
        }
        XCTAssertGreaterThan(artworks.artworks.count, 0, "Artworks can't be empty")
    }
}
