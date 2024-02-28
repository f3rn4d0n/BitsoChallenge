//
//  ArtworksLocalModel.swift
//  iOSChallenge
//
//  Created by Luis Fernando Bustos Ramírez on 13/02/24.
//

import Foundation
import SwiftData
import iOSChallengeEntities

@Model public class ArtworksLocalModel {
    
    var artworkList: ArtworksList
    
    init(artworkList: ArtworksList) {
        self.artworkList = artworkList
    }
}
