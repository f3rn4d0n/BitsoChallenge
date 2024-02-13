//
//  NetworkTargetType.swift
//  BitsoChallenge
//
//  Created by Luis Fernando Bustos Ramírez on 08/02/24.
//

import Foundation

protocol NetworkTargetType {
    var path: String { get }
    var method: String { get }
    var queryParams: [URLQueryItem] { get }
    var timeOut: Double { get }
    func makeURLRequest() throws -> URLRequest
}
