//
//  DSErrorAlert_Previews+Extension.swift
//  iOSChallengeDesignSystem
//
//  Created by Luis Fernando Bustos Ramírez on 29/02/24.
//

import Foundation
import PreviewSnapshots
import iOSChallengeEntities

extension DSErrorAlert_Previews {
    static var configuration: Array<PreviewSnapshots<ErrorDetail>.Configuration> {
        
        let twoActions = ErrorDetail(
            title: "Alert title",
            detail: "We found some problems getting your information, do you whant to try again?",
            firstAction: ErrorDetailAction (title: "Try again"),
            secondAction: ErrorDetailAction(title: "Cancel")
        )
        
        var oneAction = twoActions
        oneAction.secondAction = nil
        
        return [
            .init(name: "Two actions", state: twoActions),
            .init(name: "One action", state: oneAction)
        ]
    }
}
