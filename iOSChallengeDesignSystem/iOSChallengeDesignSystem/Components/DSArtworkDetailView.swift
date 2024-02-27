//
//  DSArtworkDetailView.swift
//  iOSChallengeDesignSystem
//
//  Created by Luis Fernando Bustos Ramírez on 27/02/24.
//

import SwiftUI

public struct DSArtworkDetailView: View {
    
    var image: String?
    var date: String?
    var author: String?
    var detail: String
    
    public init(image: String? = nil, date: String? = nil, author: String? = nil, detail: String) {
        self.image = image
        self.date = date
        self.author = author
        self.detail = detail
    }
    
    public var body: some View {
        VStack {
            DSImage(imageURL: image)
                .frame(width: DSSize.full.floatValue, height: DSSize.full.floatValue)
            if let date = date {
                Text("At: \(date)")
                    .font(Typography.italicM.font)
                    .foregroundStyle(DSColor.primary)
            } else {
                Text("At: Unknow date")
                    .font(Typography.italicM.font)
                    .foregroundStyle(DSColor.primary)
            }
            if let author = author, !author.isEmpty {
                Text("By: \(author)")
                    .font(Typography.boldM.font)
                    .foregroundStyle(DSColor.secondary)
                    .padding(.top)
            }
            Text(detail)
                .font(Typography.regularM.font)
                .lineLimit(nil)
                .multilineTextAlignment(.leading)
                .foregroundStyle(DSColor.tertiary)
                .padding(.top)
        }
        .padding()
        .background(DSColor.neutral)
    }
}

#Preview {
    Typography.registerFonts()
    return DSArtworkDetailView(
        image: "https://www.artic.edu/iiif/2/832befc5-3f12-a21f-1bdc-8f776a7f37e2/full/843,/0/default.jpg",
        date:  "2024",
        author: "Greeks",
        detail: "Cotton, wool, silk, wild silk, cotton (mercerized), cellulose acetate, rayon, and linen, plain weave with discontinuous wefts; cut and knotted warp fringe"
    )
}
