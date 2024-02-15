//
//  ArtistViewEntity+Extension.swift
//  BitsoChallenge
//
//  Created by Luis Fernando Bustos Ramírez on 15/02/24.
//

import Foundation
import BitsoChallengeEntities

extension ArtistViewEntity {
    
    static func getEmtpySample() -> ArtistViewEntity {
        return .init(
            artwork: .init(),
            artist: .init()
        )
    }
    
    static func getEmptyArtworkSample() -> ArtistViewEntity {
        return .init(
            artwork: .init(),
            artist: getArtist()
        )
    }
    
    static func getEmptyArtistSample() -> ArtistViewEntity {
        return .init(
            artwork: getArtwork(),
            artist: .init()
        )
    }
    
    static func getSample() -> ArtistViewEntity {
        return .init(
            artwork: getArtwork(),
            artist: getArtist()
        )
    }
    
    private static func getArtist() -> Artist {
        return .init(
            id: 36890,
            title: "Lenore Tawney",
            lifePeriod: "Lenore Tawney: Born at 1907, Death at: 2007",
            altNames: "- Lenora Agnes Gallagher"
        )
    }
    
    private static func getArtwork() -> Artwork {
        return .init(
            id: 0,
            title: "Antique Frieze with Labors of Hercules",
            description: "Cotton, wool, silk, wild silk, cotton (mercerized), cellulose acetate, rayon, and linen, plain weave with discontinuous wefts; cut and knotted warp fringe",
            date: "2024",
            thumbnail: "https://www.artic.edu/iiif/2/832befc5-3f12-a21f-1bdc-8f776a7f37e2/full/40,/0/default.jpg"
        )
    }
}
