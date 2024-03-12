//
//  DSErrorAlertTest.swift
//  iOSChallengeDesignSystemTests
//
//  Created by Luis Fernando Bustos Ramírez on 28/02/24.
//

import XCTest
import PreviewSnapshotsTesting
@testable import iOSChallengeDesignSystem

final class DSErrorAlertTest: XCTestCase {

    func testDSErrorAlertCapability() throws {
        DSErrorAlert_Previews.snapshots.assertSnapshots( as: .testStrategy())
    }
}
