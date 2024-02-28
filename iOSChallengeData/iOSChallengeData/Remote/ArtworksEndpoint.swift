//
//  ArtworksEndpoint.swift
//  iOSChallenge
//
//  Created by Luis Fernando Bustos Ramírez on 08/02/24.
//

import Foundation

enum ArtworksEndpoint: NetworkTargetType {
    
    case fetchArtworks(model: ArtworksRequestModel)
    case getArtist(model: ArtistRequestModel)
    
    var path: String {
        switch self {
        case .fetchArtworks:
            return "artworks"
        case .getArtist(let model):
            return "artists/\(model.artistId)"
        }
    }
    
    var queryParams: [URLQueryItem] {
        switch self {
        case .fetchArtworks(let model):
            let limit = URLQueryItem(name: "limit", value: "\(model.limit)")
            let page = URLQueryItem(name: "page", value: "\(model.page)")
            return [limit, page]
        case .getArtist:
            return []
        }
    }
    
    var method: String {
        return "GET"
    }
    
    var timeOut: Double {
        return 30.0
    }
    
    var sampleData: Data? {
        let bundle = Bundle.init(identifier: "com.lfbr.iOSChallengeData")
        let sampleData = NetworkCoreSampleData(bundle: bundle)
        
        switch self {
        case .fetchArtworks:
            return sampleData.getData(for: "Artworks")
        case .getArtist:
            return sampleData.getData(for: "Artist")
        }
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
