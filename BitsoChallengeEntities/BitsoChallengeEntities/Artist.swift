//
//  Artist.swift
//  BitsoChallenge
//
//  Created by Luis Fernando Bustos Ramírez on 12/02/24.
//

import Foundation

public struct Artist {
    public let id: Int
    public let title: String
    public let lifePeriod: String?
    public let description: String?
    public let altNames: String?
    
    public init(id: Int, title: String, lifePeriod: String?, description: String?, altNames: String?) {
        self.id = id
        self.title = title
        self.lifePeriod = lifePeriod
        self.description = description
        self.altNames = altNames
    }
}
