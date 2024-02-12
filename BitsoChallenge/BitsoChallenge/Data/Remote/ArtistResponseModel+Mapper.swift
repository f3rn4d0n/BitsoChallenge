//
//  ArtistResponseModel+Mapper.swift
//  BitsoChallenge
//
//  Created by Luis Fernando Bustos Ramírez on 12/02/24.
//

import Foundation

extension ArtistResponseModel {
    
    func mapToArtist() -> [Artist] {
        return []
    }
}

extension ArtistDetailResponseModel {
    
    func mapToArtist() -> ArtistDetail {
        return ArtistDetail()
    }
}
