//
//  Typography.swift
//  iOSChallengeDesignSystem
//
//  Created by Luis Fernando Bustos Ramírez on 26/02/24.
//

import SwiftUI

public struct Typography {
    
    // MARK: - Regular
    
    public static var regularX: Font {
        return TypographyDescription(type: .regular, size: .bigger).font
    }
    
    public static var regularM: Font {
        return TypographyDescription(type: .regular, size: .big).font
    }
    
    public static var regularS: Font {
        return TypographyDescription(type: .regular, size: .normal).font
    }
    
    // MARK: - Bold
    
    public static var boldX: Font {
        return TypographyDescription(type: .bold, size: .big).font
    }
    
    public static var boldM: Font {
        return TypographyDescription(type: .bold, size: .normal).font
    }
    
    public static var boldS: Font {
        return TypographyDescription(type: .bold, size: .small).font
    }
    
    // MARK: - Italic
    
    public static var italicX: Font {
        return TypographyDescription(type: .italic, size: .big).font
    }
    
    public static var italicM: Font {
        return TypographyDescription(type: .italic, size: .normal).font
    }
    
    public static var italicS: Font {
        return TypographyDescription(type: .italic, size: .small).font
    }
    
    static func registerFonts() {
        let fonts = Bundle(for: DSColor.self).urls(forResourcesWithExtension: "ttf", subdirectory: nil)
        fonts?.forEach({ url in
            CTFontManagerRegisterFontsForURL(url as CFURL, .process, nil)
        })
    }
}
