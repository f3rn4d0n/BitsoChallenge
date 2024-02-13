//
//  BitsoChallengeApp.swift
//  BitsoChallenge
//
//  Created by Luis Fernando Bustos Ramírez on 08/02/24.
//

import SwiftUI
import SwiftData
import BitsoChallengeData

@main
struct BitsoChallengeApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            ArtworksLocalModel.self
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ArtworksFactory.makeArtworks()
        }
        .modelContainer(sharedModelContainer)
    }
}
