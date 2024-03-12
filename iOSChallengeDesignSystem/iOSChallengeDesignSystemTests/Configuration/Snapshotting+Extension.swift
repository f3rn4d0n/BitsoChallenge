//
//  Snapshotting+Extension.swift
//  iOSChallengeDesignSystemTests
//
//  Created by Luis Fernando Bustos Ramírez on 28/02/24.
//

import Foundation
import SnapshotTesting
import SwiftUI

extension Snapshotting where Value: SwiftUI.View, Format == UIImage {
    /// Shared image test strategy
    static func testStrategy(userInterfaceStyle: UIUserInterfaceStyle = .light) -> Self {
        let traits = UITraitCollection(traitsFrom: [
            UITraitCollection(displayScale: 1),
            UITraitCollection(userInterfaceStyle: userInterfaceStyle),
        ])
        
        return .image(
            layout: .fixed(width: 400, height: 500),
            traits: traits
        )
    }
}
