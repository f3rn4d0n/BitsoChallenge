//
//  ArtworksListViewTest.swift
//  BitsoChallengeUITests
//
//  Created by Luis Fernando Bustos Ramírez on 15/02/24.
//

import XCTest
import PreviewSnapshotsTesting
@testable import BitsoChallenge

final class ArtworksListViewTest: XCTestCase {

    func testArtworksListView() throws {
        ArtworksFeatureView_Previews.snapshots.assertSnapshots()
    }
}
