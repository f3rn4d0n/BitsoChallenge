//
//  GetLocalArtworksUseCaseTest.swift
//  iOSChallengeDomainTests
//
//  Created by Luis Fernando Bustos Ramírez on 14/02/24.
//

import XCTest
import SwiftData
@testable import iOSChallengeDomain
@testable import iOSChallengeData

final class GetLocalArtworksUseCaseTest: XCTestCase {
    
    var getLocalArtworksUseCase: GetLocalArtworksUseCaseType?
    
    override func setUp() {
        super.setUp()
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try! ModelContainer(for: ArtworksLocalModel.self, configurations: config)
        let localDataSource = ArtworksLocalApi(container: container)
        getLocalArtworksUseCase = GetLocalArtworksUseCase(localDataSource: localDataSource)
    }
    
    func testGetLocalArtworksWhenAreEmpty() async throws {
        let artworksResponse = await getLocalArtworksUseCase?.execute()
        guard case .failure(let error) = artworksResponse else {
            XCTFail("Artworks should be not found")
            return
        }
        XCTAssertEqual(error as! LocalDataError, LocalDataError.dataNotFound, "Different error founded")
    }
}
