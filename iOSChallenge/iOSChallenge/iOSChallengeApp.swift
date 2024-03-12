//
//  iOSChallengeApp.swift
//  iOSChallenge
//
//  Created by Luis Fernando Bustos Ramírez on 08/02/24.
//

import SwiftUI
import SwiftData
import iOSChallengeData
import iOSChallengeDesignSystem

@main
struct iOSChallengeApp: App {
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
        doDesign()
        doNavigationAppearence()
        return WindowGroup {
            ArtworksFactory.makeArtworks()
        }
        .modelContainer(sharedModelContainer)
    }
    
    func doDesign() {
        Typography.registerFonts()
    }
    
    func doNavigationAppearence() {
        let appear = UINavigationBarAppearance()
        let largeAtters: [NSAttributedString.Key: Any] = [
            .font: Typography.boldXL.uifont!
        ]
        let compacAtters: [NSAttributedString.Key: Any] = [
            .font: Typography.boldX.uifont!
        ]
        appear.largeTitleTextAttributes = largeAtters
        appear.titleTextAttributes = compacAtters
        
        UINavigationBar.appearance().standardAppearance = appear
        UINavigationBar.appearance().compactAppearance = appear
        UINavigationBar.appearance().scrollEdgeAppearance = appear
    }
}
