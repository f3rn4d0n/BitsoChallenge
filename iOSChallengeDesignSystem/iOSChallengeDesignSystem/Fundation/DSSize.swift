//
//  DSSize.swift
//  iOSChallengeDesignSystem
//
//  Created by Luis Fernando Bustos Ramírez on 26/02/24.
//

import Foundation

enum DSSize {
    
    case biggest
    case bigger
    case big
    case normal
    case small
    case smaller
    case minimum
    
    var floatValue: CGFloat {
        switch self {
        case .biggest:
            return 36
        case .bigger:
            return 24
        case .big:
            return 18
        case .normal:
            return 12
        case .small:
            return 8
        case .smaller:
            return 4
        case .minimum:
            return 2
        }
    }
}
