//
//  DSArtistDetailView_Previews+Extension.swift
//  iOSChallengeDesignSystem
//
//  Created by Luis Fernando Bustos Ramírez on 29/02/24.
//

import Foundation
import PreviewSnapshots

extension DSArtistDetailView_Previews {
    static var configuration: Array<PreviewSnapshots<(String?, String?, String?, String?)>.Configuration> {
        
        let fullInfo: (String?, String?, String?, String?) = (
            "Leonardo da Vinci",
            "15 April 1452 – 2 May 1519",
            "- El gran caballo\n- Payne",
            "Leonardo di ser Piero da Vinci (15 April 1452 – 2 May 1519) was an Italian polymath of the High Renaissance who was active as a painter, draughtsman, engineer, scientist, theorist, sculptor, and architect. While his fame initially rested on his achievements as a painter, he has also become known for his notebooks, in which he made drawings and notes on a variety of subjects, including anatomy, astronomy, botany, cartography, painting, and paleontology. Leonardo is widely regarded to have been a genius who epitomized the Renaissance humanist ideal, and his collective works comprise a contribution to later generations of artists matched only by that of his younger contemporary Michelangelo"
        )
        
        var detailMissing = fullInfo
        detailMissing.3 = nil
        
        var pseudonymousMissing = fullInfo
        pseudonymousMissing.2 = nil
        
        let allMissing: (String?, String?, String?, String?) = (nil, nil, nil, nil)
        
        return [
            .init(name: "Full", state: fullInfo),
            .init(name: "Empty", state: allMissing),
            .init(name: "Pseudonymous missing", state: pseudonymousMissing),
            .init(name: "Detail Missing", state: detailMissing)
        ]
    }
}
