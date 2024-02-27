//
//  DSErrorAlert.swift
//  iOSChallengeDesignSystem
//
//  Created by Luis Fernando Bustos Ramírez on 27/02/24.
//

import SwiftUI

public struct DSErrorAlert: View {
    
    var title: String
    var message: String
    var firstActionTitle: String
    var firstAction: (() -> (Void))
    var secondActionTitle: String
    var secondAction: (() -> (Void))
    
    public init(title: String, message: String, firstActionTitle: String, firstAction: @escaping (() -> (Void)), secondActionTitle: String, secondAction: @escaping (() -> (Void))) {
        self.title = title
        self.message = message
        self.firstActionTitle = firstActionTitle
        self.firstAction = firstAction
        self.secondActionTitle = secondActionTitle
        self.secondAction = secondAction
    }
    
    
    public var body: some View {
        VStack {
            Image(systemName: "exclamationmark.triangle.fill")
                .resizable()
                .frame(width: DSSize.bigger.floatValue, height: DSSize.bigger.floatValue)
                .foregroundStyle(DSColor.neutral)
                .padding()
            Text(title)
                .lineLimit(2)
                .multilineTextAlignment(.center)
                .font(Typography.boldX.font)
                .foregroundStyle(DSColor.neutral)
            Text(message)
                .lineLimit(8)
                .multilineTextAlignment(.center)
                .font(Typography.regularM.font)
                .foregroundStyle(DSColor.neutral)
                .padding()
            DSButton(
                style: .mainly,
                icon: nil,
                message: firstActionTitle,
                action: firstAction
            )
            .padding(.horizontal)
            DSButton(
                style: .secondary,
                icon: nil,
                message: secondActionTitle,
                action: secondAction
            )
            .padding()
        }
        .background(DSColor.secondary)
        .cornerRadius(DSSize.normal.floatValue)
        .padding()
        
    }
}

#Preview {
    Typography.registerFonts()
    return DSErrorAlert(
        title: "Alert title",
        message: "We found some problems getting your information, do you whant to try again?",
        firstActionTitle: "Try again",
        firstAction: {
            print("Try again")
        },
        secondActionTitle: "Cancel",
        secondAction: {
            print("Cancel")
        }
    )
}
