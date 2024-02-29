//
//  DSContentUnavailableViewTest.swift
//  iOSChallengeDesignSystemTests
//
//  Created by Luis Fernando Bustos Ramírez on 28/02/24.
//

import XCTest
import PreviewSnapshotsTesting
@testable import iOSChallengeDesignSystem

final class DSContentUnavailableViewTest: XCTestCase {

    func testContentUnavailableViewCapabilityLight() throws {
        DSContentUnavailableView_Previews.snapshots.assertSnapshots( as: .testStrategy())
    }
    
    func testContentUnavailableViewCapabilityDarkMode() throws {
        DSContentUnavailableView_Previews.snapshots.assertSnapshots( as: .testStrategy(userInterfaceStyle: .dark))
    }
}
