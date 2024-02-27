//
//  DSArtistDetailView.swift
//  iOSChallengeDesignSystem
//
//  Created by Luis Fernando Bustos Ramírez on 27/02/24.
//

import SwiftUI

public struct DSArtistDetailView: View {
    
    var title: String
    var period: String?
    var pseudonymous: String?
    var description: String?
    
    public init(title: String, period: String? = nil, pseudonymous: String? = nil, description: String? = nil) {
        self.title = title
        self.period = period
        self.pseudonymous = pseudonymous
        self.description = description
    }
    
    public var body: some View {
        VStack {
            Divider()
                .background(DSColor.primary)
            if let period = period {
                Text("\(title): \(period)")
                    .font(Typography.boldM.font)
                    .foregroundStyle(DSColor.primary)
            }
            if let pseudonymous = pseudonymous {
                Text("Other artist names:")
                    .font(Typography.italicM.font)
                    .foregroundStyle(DSColor.secondary)
                Text(pseudonymous)
                    .font(Typography.italicS.font)
                    .foregroundStyle(DSColor.secondary)
            }
            if let description = description {
                Text(description)
                    .lineLimit(nil)
                    .multilineTextAlignment(.leading)
                    .font(Typography.italicM.font)
                    .foregroundStyle(DSColor.tertiary)
                    .padding()
            }
        }
        .background(DSColor.neutral)
    }
}

#Preview {
    Typography.registerFonts()
    return DSArtistDetailView(
        title: "Leonardo da Vinci",
        period: "15 April 1452 – 2 May 1519",
        pseudonymous: "- El gran caballo\n- Payne",
        description: "Leonardo di ser Piero da Vinci (15 April 1452 – 2 May 1519) was an Italian polymath of the High Renaissance who was active as a painter, draughtsman, engineer, scientist, theorist, sculptor, and architect. While his fame initially rested on his achievements as a painter, he has also become known for his notebooks, in which he made drawings and notes on a variety of subjects, including anatomy, astronomy, botany, cartography, painting, and paleontology. Leonardo is widely regarded to have been a genius who epitomized the Renaissance humanist ideal, and his collective works comprise a contribution to later generations of artists matched only by that of his younger contemporary Michelangelo"
    )
}
