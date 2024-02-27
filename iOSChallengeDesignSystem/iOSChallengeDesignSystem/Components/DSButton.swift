//
//  DSButton.swift
//  iOSChallengeDesignSystem
//
//  Created by Luis Fernando Bustos Ramírez on 26/02/24.
//

import SwiftUI

enum DSButtonStyle {
    case mainly
    case secondary
}

struct DSButton: View {
    
    var style: DSButtonStyle
    var icon: Image?
    var message: String
    var action: (() -> (Void))
    
    var body: some View {
        Button(action: {
            self.action()
        }, label: {
            HStack {
                Spacer()
                icon?
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(style == .mainly ? DSColor.neutral : DSColor.primary)
                    .frame(width: DSSize.normal.floatValue, height: DSSize.normal.floatValue)
                Text(message)
                    .lineLimit(2)
                    .multilineTextAlignment(.center)
                    .font(Typography.regularM)
                Spacer()
            }
            .padding()
            .foregroundColor(style == .mainly ? DSColor.neutral : DSColor.primary)
            .background(style == .mainly ? DSColor.primary : DSColor.neutral)
            .cornerRadius(DSSize.normal.floatValue)
            .padding()
        })
    }
}

#Preview {
    Typography.registerFonts()
    return DSButton(style: .mainly, icon: Image(systemName: "pencil"), message: "Click to excecute", action: {
        print("Clicked")
    })
}
