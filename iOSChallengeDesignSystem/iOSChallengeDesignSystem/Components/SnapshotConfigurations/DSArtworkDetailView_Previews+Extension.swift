//
//  DSArtworkDetailView_Previews+Extension.swift
//  iOSChallengeDesignSystem
//
//  Created by Luis Fernando Bustos Ramírez on 29/02/24.
//

import Foundation
import PreviewSnapshots

extension DSArtworkDetailView_Previews {
    static var configuration: Array<PreviewSnapshots<(String?, String?, String?)>.Configuration> {
        
        let fullInfo: (String?, String?, String?) = (
            "https://www.artic.edu/iiif/2/832befc5-3f12-a21f-1bdc-8f776a7f37e2/full/843,/0/default.jpg",
            "2024",
            "Greeks"
        )
        
        var imageMissing = fullInfo
        imageMissing.0 = nil
        
        var periodMissing = fullInfo
        periodMissing.1 = nil
        
        var authorMissing = fullInfo
        authorMissing.2 = nil
        
        let allMissing: (String?, String?, String?) = (nil, nil, nil)
        
        return [
            .init(name: "Full", state: fullInfo),
            .init(name: "Empty", state: allMissing),
            .init(name: "Image missing", state: imageMissing),
            .init(name: "Period missing", state: periodMissing),
            .init(name: "Author missing", state: authorMissing)
        ]
    }
}
