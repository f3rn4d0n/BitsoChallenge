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
            description: "Lenore Tawney (born Leonora Agnes Gallagher; May 10, 1907 – September 24, 2007) was an American artist working in fiber art, collage, assemblage, and drawing. She is considered to be a groundbreaking artist for the elevation of craft processes to fine art status, two communities which were previously mutually exclusive. Tawney was born and raised in an Irish-American family in Lorain, Ohio near Cleveland and later moved to Chicago to start her career. In the 1940's and 50's, she studied art at several different institutions and perfected her craft as a weaver. In 1957, she moved to New York where she maintained a highly successful career into the 1960's. In the 1970's Tawney focused increasingly on her spirituality, but continued to make work until her death.",
            altNames: "- Lenora Agnes Gallagher"
        )
    }
    
    private static func getArtwork() -> Artwork {
        return .init(
            id: 0,
            title: "Antique Frieze with Labors of Hercules",
            description: "Cotton, wool, silk, wild silk, cotton (mercerized), cellulose acetate, rayon, and linen, plain weave with discontinuous wefts; cut and knotted warp fringe",
            date: "2024",
            image: "https://www.artic.edu/iiif/2/832befc5-3f12-a21f-1bdc-8f776a7f37e2/full/843,/0/default.jpg",
            thumbnail: "https://www.artic.edu/iiif/2/832befc5-3f12-a21f-1bdc-8f776a7f37e2/full/40,/0/default.jpg"
        )
    }
}
