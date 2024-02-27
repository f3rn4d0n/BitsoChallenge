//
//  DSCellView.swift
//  iOSChallengeDesignSystem
//
//  Created by Luis Fernando Bustos Ramírez on 26/02/24.
//

import SwiftUI

public enum DSCellStyleView {
    case primary
    case secondary
    
    var backgroundColor: Color {
        switch self {
        case .primary:
            DSColor.tertiary
        case .secondary:
            DSColor.neutral
        }
    }
}

public struct DSCellView: View {
    var title: String
    var message: String
    var imageURL: String?
    var callToAction: String?
    var style: DSCellStyleView
    var action: (() -> (Void))
    
    public init(title: String, message: String, imageURL: String? = nil, callToAction: String? = nil, style: DSCellStyleView, action: @escaping (() -> (Void))) {
        self.title = title
        self.message = message
        self.imageURL = imageURL
        self.callToAction = callToAction
        self.style = style
        self.action = action
    }
    
    public var body: some View {
        Button(action: {
            self.action()
        }, label: {
            HStack {
                VStack {
                    HStack {
                        Text(title)
                            .lineLimit(2)
                            .multilineTextAlignment(.leading)
                            .font(Typography.boldM.font)
                            .foregroundColor(DSColor.primary)
                        Spacer()
                    }
                    .padding(.bottom)
                    HStack {
                        Text(message)
                            .lineLimit(nil)
                            .multilineTextAlignment(.leading)
                            .font(Typography.regularS.font)
                            .foregroundColor(DSColor.secondary)
                        Spacer()
                    }
                }
                VStack {
                    if let image = imageURL {
                        DSImage(imageURL: image)
                            .frame(height: DSSize.gigant.floatValue)
                    }
                    Text(callToAction ?? "See detail")
                        .font(Typography.italicS.font)
                        .foregroundColor(DSColor.secondary)
                }
                .frame(
                    width: DSSize.gigant.floatValue
                )
                .padding(.leading)
            }
            .padding()
            .background(style.backgroundColor)
        })
        .listRowSeparator(.hidden)
        .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
    }
}

#Preview {
    Typography.registerFonts()
    return DSCellView(
        title: "Title of piece of art",
        message: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut posuere massa nunc, ac congue mauris ultricies non. Nulla vitae faucibus lorem, interdum ullamcorper nibh. Morbi molestie sagittis tellus in accumsan. Vivamus hendrerit risus sem, nec mollis ipsum luctus vitae. Mauris quis dui finibus, sagittis ex sit amet, rutrum turpis. Praesent in bibendum nisl. Aenean id accumsan ex, et eleifend ante. Maecenas laoreet rhoncus eros, eu volutpat elit viverra eget. Donec nec tempus ante, mollis tempus elit. Sed vulputate lacus tortor, at sollicitudin augue varius sit amet. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Vivamus eu malesuada risus.",
        imageURL: "https://www.artic.edu/iiif/2/021d3847-e0b1-2bc5-f3a6-282229b86a29/full/40,/0/default.jpg",
        callToAction: "Click to see more",
        style: .primary) {
            print("See more")
        }
}
