//
//  DSButton.swift
//  iOSChallengeDesignSystem
//
//  Created by Luis Fernando Bustos Ramírez on 26/02/24.
//

import SwiftUI
import PreviewSnapshots

public enum DSButtonStyle {
    case mainly
    case secondary
    case tertiary
    
    var foregroundColor: Color {
        switch self {
        case .mainly, .tertiary:
            DSColor.primary
        case .secondary:
            DSColor.neutral
        }
    }
    
    var backgroundColor: Color {
        switch self {
        case .mainly:
            DSColor.neutral
        case .secondary:
            DSColor.primary
        case .tertiary:
            .clear
        }
    }
}

public struct DSButton: View {
    
    var style: DSButtonStyle
    var icon: Image?
    var message: String
    var action: (() async -> Void)?
    
    public init(style: DSButtonStyle, icon: Image? = nil, message: String, action:  (() async -> Void)? = nil) {
        self.style = style
        self.icon = icon
        self.message = message
        self.action = action
    }
    
    public var body: some View {
        Button(action: {
            Task {
                await self.action?()
            }
        }, label: {
            HStack {
                Spacer()
                icon?
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(style.foregroundColor)
                    .frame(width: DSSize.normal.floatValue, height: DSSize.normal.floatValue)
                Text(message)
                    .lineLimit(2)
                    .multilineTextAlignment(.center)
                    .font(Typography.regularX.font)
                Spacer()
            }
            .padding()
            .foregroundColor(style.foregroundColor)
            .background(style.backgroundColor)
            .cornerRadius(DSSize.normal.floatValue)
        })
    }
}

struct DSButton_Previews: PreviewProvider {
    
    static var previews: some View {
        snapshots.previews.previewLayout(.sizeThatFits)
    }
    
    static var snapshots: PreviewSnapshots<DSButtonStyle> {
        Typography.registerFonts()
        return PreviewSnapshots(
            configurations: [
                .init(name: "Mainly", state: .mainly),
                .init(name: "Secondary", state: .secondary),
                .init(name: "Tertiary", state: .tertiary),
            ],
            configure: { style in
                return ZStack{
                    DSColor.contrast
                        .edgesIgnoringSafeArea(.all)
                    DSButton(
                        style: style,
                        icon: Image(systemName: "pencil"),
                        message: "Click to excecute"
                    ).padding()
                }
            }
        )
    }
}
