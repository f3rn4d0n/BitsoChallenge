//
//  Artist.swift
//  BitsoChallenge
//
//  Created by Luis Fernando Bustos Ramírez on 08/02/24.
//

import Foundation

struct Artist: Hashable,  Identifiable {
    let id = UUID()
    let title: String
}
