//
//  SaveLocalArtworksUseCaseTest.swift
//  BitsoChallengeDomainTests
//
//  Created by Luis Fernando Bustos Ramírez on 14/02/24.
//

import XCTest
import SwiftData
@testable import BitsoChallengeDomain
@testable import BitsoChallengeData

final class SaveLocalArtworksUseCaseTest: XCTestCase {
    
    var saveLocalUseCase: SaveLocalArtworksUseCaseType?
    
    override func setUp() {
        super.setUp()
        
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try! ModelContainer(for: ArtworksLocalModel.self, configurations: config)
        let localDataSource = ArtworksLocalApi(container: container)
        saveLocalUseCase = SaveLocalArtworksUseCase(localDataSource: localDataSource)
    }
    
    func testSaveFromEmptySuccess() async throws {
        let saveResponse = await saveLocalUseCase?.execute(artwoks: [], currentPage: 0, totalPages: 1)
        guard case .success(_) = saveResponse else {
            XCTFail("Artworks should be saved")
            return
        }
    }
}
