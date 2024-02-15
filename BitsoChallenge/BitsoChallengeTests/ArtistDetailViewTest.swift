//
//  ArtistDetailViewTest.swift
//  BitsoChallengeTests
//
//  Created by Luis Fernando Bustos Ramírez on 15/02/24.
//

import XCTest
import PreviewSnapshotsTesting
@testable import BitsoChallenge

final class ArtistDetailViewTest: XCTestCase {
    
    func testArtistDetailView() throws {
        ArtistFeatureView_Previews.snapshots.assertSnapshots()
    }
}
