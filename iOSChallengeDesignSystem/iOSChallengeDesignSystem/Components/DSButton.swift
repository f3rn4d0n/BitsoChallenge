//
//  DSButton.swift
//  iOSChallengeDesignSystem
//
//  Created by Luis Fernando Bustos Ramírez on 26/02/24.
//

import SwiftUI

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
    var action: (() -> (Void))
    
    public init(style: DSButtonStyle, icon: Image? = nil, message: String, action: @escaping (() -> (Void))) {
        self.style = style
        self.icon = icon
        self.message = message
        self.action = action
    }
    
    public var body: some View {
        Button(action: {
            self.action()
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
            .padding()
        })
    }
}

#Preview {
    Typography.registerFonts()
    return DSButton(
        style: .mainly,
        icon: Image(systemName: "pencil"),
        message: "Click to excecute",
        action: {
            print("Clicked")
        }
    )
}
