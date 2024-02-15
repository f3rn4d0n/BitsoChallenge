//
//  ClearLocalArtworksUseCaseTest.swift
//  BitsoChallengeDomainTests
//
//  Created by Luis Fernando Bustos Ramírez on 14/02/24.
//

import XCTest
import SwiftData
@testable import BitsoChallengeDomain
@testable import BitsoChallengeData

final class ClearLocalArtworksUseCaseTest: XCTestCase {
    
    var clearLocalUseCase: ClearLocalArtworksUseCaseType?
    
    override func setUp() {
        super.setUp()
        
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try! ModelContainer(for: ArtworksLocalModel.self, configurations: config)
        let localDataSource = ArtworksLocalApi(container: container)
        clearLocalUseCase = ClearLocalArtworksUseCase(localDataSource: localDataSource)
    }
    
    func testSaveFromEmptySuccess() async throws {
        let saveResponse = await clearLocalUseCase?.execute()
        guard case .success(_) = saveResponse else {
            XCTFail("Artworks should be removed")
            return
        }
    }
}
