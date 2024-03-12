//
//  DSCellViewTest.swift
//  iOSChallengeDesignSystemTests
//
//  Created by Luis Fernando Bustos Ramírez on 28/02/24.
//

import XCTest
import PreviewSnapshotsTesting
@testable import iOSChallengeDesignSystem

final class DSCellViewTest: XCTestCase {

    func testDSCellViewCapability() throws {
        DSCellView_Previews.snapshots.assertSnapshots( as: .testStrategy())
    }
}
