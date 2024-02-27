//
//  DSContentUnavailableView.swift
//  iOSChallengeDesignSystem
//
//  Created by Luis Fernando Bustos Ramírez on 27/02/24.
//

import SwiftUI

public struct DSContentUnavailableView: View {
    
    var title: String
    var systemImage: String
    var description: String
    
    public init(title: String, systemImage: String, description: String) {
        self.title = title
        self.systemImage = systemImage
        self.description = description
    }
    
    public var body: some View {
        ContentUnavailableView {
            Label(title, systemImage: systemImage)
                .font(Typography.boldX.font)
        } description: {
            Text(description)
                .font(Typography.regularM.font)
        }
    }
}

#Preview {
    DSContentUnavailableView(
        title: "No artworks founded",
        systemImage: "book.fill",
        description: "Pull to refresh"
    )
}
