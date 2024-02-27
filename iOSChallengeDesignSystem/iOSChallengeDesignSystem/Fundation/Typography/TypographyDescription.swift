//
//  TypographyDescription.swift
//  iOSChallengeDesignSystem
//
//  Created by Luis Fernando Bustos Ramírez on 26/02/24.
//

import SwiftUI

struct TypographyDescription {
    
    let type: TypographyType
    let size: DSSize
    
    var font: Font {
        return Font.custom(type.rawValue, size: size.floatValue)
    }
}
