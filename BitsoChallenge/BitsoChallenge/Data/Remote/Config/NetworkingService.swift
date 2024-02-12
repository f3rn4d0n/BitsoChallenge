//
//  NetworkingService.swift
//  BitsoChallenge
//
//  Created by Luis Fernando Bustos Ramírez on 08/02/24.
//

import Foundation

public protocol NetworkServiceType {
    func request<T: Decodable>(target: NetworkTargetType) async throws -> T
}

struct RequestNetworkProvider: NetworkServiceType {
    private let urlSession: URLSession
    
    init(urlSession: URLSession = URLSession.shared) {
        self.urlSession = urlSession
    }
    
    private func handleResponse(data: Data, response: URLResponse) throws {
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }
        
        guard (200 ..< 300).contains(httpResponse.statusCode) else {
            throw NetworkError.invalidStatus(code: httpResponse.statusCode)
        }
    }
    
    public func request<T: Decodable>(target: NetworkTargetType) async throws -> T {
        let request = try target.makeURLRequest()
        
        let (data, response) = try await urlSession.data(for: request)
        
        try handleResponse(data: data, response: response)
        
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let decodedData = try decoder.decode(T.self, from: data)
            return decodedData
        } catch {
            throw NetworkError.dataConversionFailure(error: error.localizedDescription)
        }
    }
}
