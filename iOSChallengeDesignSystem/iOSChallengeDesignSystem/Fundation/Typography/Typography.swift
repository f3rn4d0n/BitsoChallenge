//
//  Typography.swift
//  iOSChallengeDesignSystem
//
//  Created by Luis Fernando Bustos Ramírez on 26/02/24.
//

import SwiftUI

public struct Typography {
    
    // MARK: - Regular
    
    public static var regularXL: TypographyDescription {
        return TypographyDescription(type: .regular, size: .biggest)
    }
    
    public static var regularX: TypographyDescription {
        return TypographyDescription(type: .regular, size: .big)
    }
    
    public static var regularM: TypographyDescription {
        return TypographyDescription(type: .regular, size: .normal)
    }
    
    public static var regularS: TypographyDescription {
        return TypographyDescription(type: .regular, size: .small)
    }
    
    // MARK: - Bold
    
    public static var boldXL: TypographyDescription {
        return TypographyDescription(type: .bold, size: .biggest)
    }
    
    public static var boldX: TypographyDescription {
        return TypographyDescription(type: .bold, size: .big)
    }
    
    public static var boldM: TypographyDescription {
        return TypographyDescription(type: .bold, size: .normal)
    }
    
    public static var boldS: TypographyDescription {
        return TypographyDescription(type: .bold, size: .small)
    }
    
    // MARK: - Italic
    
    public static var italicXL: TypographyDescription {
        return TypographyDescription(type: .italic, size: .biggest)
    }
    
    public static var italicX: TypographyDescription {
        return TypographyDescription(type: .italic, size: .big)
    }
    
    public static var italicM: TypographyDescription {
        return TypographyDescription(type: .italic, size: .normal)
    }
    
    public static var italicS: TypographyDescription {
        return TypographyDescription(type: .italic, size: .small)
    }
}

extension Typography {
    
    public static func registerFonts() {
        let fonts = Bundle(for: DSColor.self).urls(forResourcesWithExtension: "ttf", subdirectory: nil)
        fonts?.forEach({ url in
            CTFontManagerRegisterFontsForURL(url as CFURL, .process, nil)
        })
    }
}
