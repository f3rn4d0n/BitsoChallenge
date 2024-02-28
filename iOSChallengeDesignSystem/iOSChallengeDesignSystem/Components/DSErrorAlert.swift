//
//  DSErrorAlert.swift
//  iOSChallengeDesignSystem
//
//  Created by Luis Fernando Bustos Ramírez on 27/02/24.
//

import SwiftUI
import iOSChallengeEntities

public struct DSErrorAlert: View {
    
    var error: ErrorDetail
    
    public init(error: ErrorDetail) {
        self.error = error
    }
    
    public var body: some View {
        ZStack {
            DSColor.tertiary
                .edgesIgnoringSafeArea(.all)
                .opacity(0.5)
            VStack {
                Image(systemName: "exclamationmark.triangle.fill")
                    .resizable()
                    .frame(width: DSSize.bigger.floatValue, height: DSSize.bigger.floatValue)
                    .foregroundStyle(DSColor.neutral)
                    .padding()
                Text(error.title)
                    .lineLimit(2)
                    .multilineTextAlignment(.center)
                    .font(Typography.boldX.font)
                    .foregroundStyle(DSColor.neutral)
                Text(error.detail)
                    .lineLimit(8)
                    .multilineTextAlignment(.center)
                    .font(Typography.regularX.font)
                    .foregroundStyle(DSColor.neutral)
                    .padding(.horizontal)
                    .padding(.bottom)
                    .padding(.top, DSSize.minimum.floatValue)
                DSButton(
                    style: .mainly,
                    icon: nil,
                    message: error.firstAction.title,
                    action: error.firstAction.action
                )
                .padding(.horizontal)
                .padding(.bottom)
                if let action = error.secondAction {
                    DSButton(
                        style: .secondary,
                        icon: nil,
                        message: action.title,
                        action: action.action
                    )
                    .padding(.horizontal)
                    .padding(.bottom)
                }
            }
            .background(DSColor.secondary)
            .cornerRadius(DSSize.normal.floatValue)
            .padding()
        }
    }
}

#Preview {
    Typography.registerFonts()
    return DSErrorAlert(
        error: .init(
            title: "Alert title",
            detail: "We found some problems getting your information, do you whant to try again?",
            firstAction: ErrorDetailAction(
                title: "Try again",
                action: {
                    print("Try again")
                }
            ),
            secondAction: ErrorDetailAction(title: "Cancel")
        )
    )
}
