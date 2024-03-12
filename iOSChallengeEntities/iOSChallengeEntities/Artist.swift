//
//  Artist.swift
//  iOSChallenge
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
    
    public init(id: Int = 0, title: String = "", lifePeriod: String? = nil, description: String? = nil, altNames: String? = nil) {
        self.id = id
        self.title = title
        self.lifePeriod = lifePeriod
        self.description = description
        self.altNames = altNames
    }
}
