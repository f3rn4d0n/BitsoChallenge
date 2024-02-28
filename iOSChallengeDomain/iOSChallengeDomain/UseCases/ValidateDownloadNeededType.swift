//
//  ValidateSmoothDownloadNeededType.swift
//  iOSChallengeDomain
//
//  Created by Luis Fernando Bustos Ramírez on 14/02/24.
//

import Foundation
import iOSChallengeEntities

public protocol ValidateDownloadNeededType {
    
    func execute(artwork: Artwork, in artworks: [Artwork], isLoading: Bool, currentPage: Int, totalPages: Int) -> Bool
}

public struct ValidateSmoothDownloadNeededUseCase: ValidateDownloadNeededType {
    
    public init() { }
    
    public func execute(artwork: Artwork, in artworks: [Artwork], isLoading: Bool, currentPage: Int, totalPages: Int) -> Bool {
        if let index = artworks.firstIndex(of: artwork) {
            if artworks.count - index > 5 {
                return false
            }
        }
        return currentPage < totalPages && !isLoading
    }
}
