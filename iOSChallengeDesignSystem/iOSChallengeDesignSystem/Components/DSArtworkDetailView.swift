//
//  DSArtworkDetailView.swift
//  iOSChallengeDesignSystem
//
//  Created by Luis Fernando Bustos Ramírez on 27/02/24.
//

import SwiftUI
import PreviewSnapshots

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

struct DSArtworkDetailView_Previews: PreviewProvider {
    
    static var previews: some View {
        snapshots.previews.previewLayout(.sizeThatFits)
    }
    
    static var snapshots: PreviewSnapshots<(String?, String?, String?)> {
        Typography.registerFonts()
        return PreviewSnapshots(
            configurations: DSArtworkDetailView_Previews.configuration,
            configure: { content in
                return DSArtworkDetailView(
                    image: content.0,
                    date: content.1,
                    author: content.2,
                    detail: "Cotton, wool, silk, wild silk, cotton (mercerized), cellulose acetate, rayon, and linen, plain weave with discontinuous wefts; cut and knotted warp fringe"
                )
            }
        )
    }
}
