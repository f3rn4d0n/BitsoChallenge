//
//  ArtworksRouter.swift
//  iOSChallenge
//
//  Created by Luis Fernando Bustos Ramírez on 08/02/24.
//

import Foundation
import SwiftUI

public protocol ArtworksRouterType {
    associatedtype Route
    associatedtype View: SwiftUI.View
    @ViewBuilder func goToView(for route: Route, path: Binding<NavigationPath>) -> Self.View
}

struct ArtworksRouter: ArtworksRouterType {
    
    func goToView(for route: ArtworksRouterEntity, path: Binding<NavigationPath>) -> some View {
        switch route {
        case .detail(let artwork):
            ArtistFactory.makeArtist(path: path, artwork: artwork)
        }
    }
}
