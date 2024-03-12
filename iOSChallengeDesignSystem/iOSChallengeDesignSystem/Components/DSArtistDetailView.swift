//
//  DSArtistDetailView.swift
//  iOSChallengeDesignSystem
//
//  Created by Luis Fernando Bustos Ramírez on 27/02/24.
//

import SwiftUI
import PreviewSnapshots

public struct DSArtistDetailView: View {
    
    var title: String?
    var period: String?
    var pseudonymous: String?
    var description: String?
    
    public init(title: String? = nil, period: String? = nil, pseudonymous: String? = nil, description: String? = nil) {
        self.title = title
        self.period = period
        self.pseudonymous = pseudonymous
        self.description = description
    }
    
    public var body: some View {
        VStack {
            Divider()
                .background(DSColor.primary)
            if let author = title, let period = period {
                Text("\(author): \(period)")
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

struct DSArtistDetailView_Previews: PreviewProvider {
    
    static var previews: some View {
        snapshots.previews.previewLayout(.sizeThatFits)
    }
    
    static var snapshots: PreviewSnapshots<(String?, String?, String?, String?)> {
        Typography.registerFonts()
        return PreviewSnapshots(
            configurations: DSArtistDetailView_Previews.configuration,
            configure: { content in
                return DSArtistDetailView(
                    title: content.0,
                    period: content.1,
                    pseudonymous: content.2,
                    description: content.3
                )
            }
        )
    }
}
