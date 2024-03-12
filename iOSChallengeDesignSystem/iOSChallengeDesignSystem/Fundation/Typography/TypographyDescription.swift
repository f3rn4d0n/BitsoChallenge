//
//  TypographyDescription.swift
//  iOSChallengeDesignSystem
//
//  Created by Luis Fernando Bustos Ramírez on 26/02/24.
//

import SwiftUI

public struct TypographyDescription {
    
    let type: TypographyType
    let size: DSSize
    
    public var font: Font {
        return Font.custom(type.rawValue, size: size.floatValue)
    }
    
    public var uifont: UIFont? {
        return UIFont(name: type.rawValue, size: size.floatValue)
    }
}
