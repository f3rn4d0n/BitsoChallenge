//
//  GetArtistUseCaseTest.swift
//  BitsoChallengeDomainTests
//
//  Created by Luis Fernando Bustos Ramírez on 14/02/24.
//

import XCTest
@testable import BitsoChallengeDomain
@testable import BitsoChallengeData

final class GetArtistUseCaseTest: XCTestCase {
    
    var getArtistUseCase: GetArtistUseCaseType?
    
    override func setUp() {
        super.setUp()
        let mockNetworkingProvider = MockNetworkProvider()
        let mockDataSource = ArtworksApi(service: mockNetworkingProvider)
        getArtistUseCase = GetArtistUseCase(remoteDataSource: mockDataSource)
    }
    
    func testGetArtist() async throws {
        let artistResponse = await getArtistUseCase?.execute(artistId: 1)
        guard case .success(let artist) = artistResponse else {
            XCTFail("Artist not found")
            return
        }
        XCTAssertNotNil(artist.title, "Artist title can't be nil")
    }
}
