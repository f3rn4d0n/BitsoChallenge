//
//  ArtworksLocalModel.swift
//  BitsoChallenge
//
//  Created by Luis Fernando Bustos Ramírez on 13/02/24.
//

import Foundation
import SwiftData
import BitsoChallengeEntities

@Model public class ArtworksLocalModel {
    
    var artworkList: ArtworksList
    
    init(artworkList: ArtworksList) {
        self.artworkList = artworkList
    }
}
