//
//  ArtistRouter.swift
//  BitsoChallenge
//
//  Created by Luis Fernando Bustos Ramírez on 08/02/24.
//

import Foundation

enum ArtistEndpoint: NetworkTargetType {
    
    case fetchArtists(model: ArtistRequestModel)
    case detailArtist(model: ArtistDetailRequestModel)
    
    var path: String {
        switch self {
        case .fetchArtists:
            return "artworks"
        case .detailArtist(let model):
            return "artists/\(model.artistId)"
        }
    }
    
    var queryParams: [URLQueryItem] {
        switch self {
        case .fetchArtists(let model):
            let limit = URLQueryItem(name: "limit", value: "\(model.limit)")
            let page = URLQueryItem(name: "page", value: "\(model.page)")
            return [limit, page]
        case .detailArtist:
            return []
        }
    }
    
    var method: String {
        return "GET"
    }
    
    var timeOut: Double {
        return 30.0
    }
    
    func makeURLRequest() throws -> URLRequest {
        guard let baseURL = URL(string: ApiConstants.baseURL + path) else {
            throw NetworkError.invalidURL
        }
        let url = baseURL.appending(queryItems: queryParams)
        var request = URLRequest(url: url)
        request.timeoutInterval = TimeInterval(floatLiteral: timeOut)
        request.httpMethod = method
        return request
    }
}
