//
//  ValidateDownloadNeededTest.swift
//  iOSChallengeDomainTests
//
//  Created by Luis Fernando Bustos Ramírez on 14/02/24.
//

import XCTest
@testable import iOSChallengeDomain
@testable import iOSChallengeEntities

final class ValidateDownloadNeededUseCaseTest: XCTestCase {
    
    var validateUseCase: ValidateDownloadNeededType?
    
    override func setUp() {
        super.setUp()
        validateUseCase = ValidateSmoothDownloadNeededUseCase()
    }
    
    func testNotDownloadIfIsLoading() {
        let downloadNeeded = validateUseCase?.execute(artwork: Artwork(), in: [], isLoading: true, currentPage: 0, totalPages: 1)
        guard let download = downloadNeeded else {
            XCTFail("Download cant be nil")
            return
        }
        XCTAssertFalse(download, "No multidownloads available")
    }
    
    func testNotDownloadIfWeAreInLastPage() {
        let downloadNeeded = validateUseCase?.execute(artwork: Artwork(), in: [], isLoading: false, currentPage: 10, totalPages: 10)
        guard let download = downloadNeeded else {
            XCTFail("Download cant be nil")
            return
        }
        XCTAssertFalse(download, "We are in maximum page")
    }
    
    func testNotDownloadIfWeSoFarAwayFromLastIndex() {
        let currentArtwork = Artwork(id: 6)
        var allArtworks: [Artwork] = []
        for i in 0 ..< 20 {
            allArtworks.append(Artwork(id: i))
        }
        let downloadNeeded = validateUseCase?.execute(artwork: currentArtwork, in: allArtworks, isLoading: false, currentPage: 1, totalPages: 10)
        guard let download = downloadNeeded else {
            XCTFail("Download cant be nil")
            return
        }
        XCTAssertFalse(download, "We are so far away from last index")
    }
    
    func testDownloadIfWeAreCloserFromLastIndex() {
        let currentArtwork = Artwork(id: 19)
        var allArtworks: [Artwork] = []
        for i in 0 ..< 20 {
            allArtworks.append(Artwork(id: i))
        }
        let downloadNeeded = validateUseCase?.execute(artwork: currentArtwork, in: allArtworks, isLoading: false, currentPage: 1, totalPages: 10)
        guard let download = downloadNeeded else {
            XCTFail("Download cant be nil")
            return
        }
        XCTAssertTrue(download, "We are closer to last index")
    }
}
