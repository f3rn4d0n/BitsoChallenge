//
//  ErrorDetail.swift
//  iOSChallengeEntities
//
//  Created by Luis Fernando Bustos Ramírez on 26/02/24.
//

import Foundation

public struct ErrorDetail {
    
    public var title: String
    public var detail: String
    public var firstAction: ErrorDetailAction
    public var secondAction: ErrorDetailAction?
    
    public init(title: String, detail: String, firstAction: ErrorDetailAction, secondAction: ErrorDetailAction? = nil) {
        self.title = title
        self.detail = detail
        self.firstAction = firstAction
        self.secondAction = secondAction
    }
}

public struct ErrorDetailAction {
    
    public var title: String
    public var action: (() async -> Void)?
    
    public init(title: String, action: (() async -> Void)? = nil) {
        self.title = title
        self.action = action
    }
}
