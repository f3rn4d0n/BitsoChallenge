//
//  ArtistsRouter.swift
//  BitsoChallenge
//
//  Created by Luis Fernando Bustos Ramírez on 08/02/24.
//

import Foundation
import SwiftUI

public protocol ArtistsRouterType {
    associatedtype Route
    associatedtype View: SwiftUI.View
    @ViewBuilder func goToView(for route: Route, path: Binding<NavigationPath>) -> Self.View
}

struct ArtistsRouter: ArtistsRouterType {
    
    func goToView(for route: ArtistsRouterEntity, path: Binding<NavigationPath>) -> some View {
        switch route {
        case .detail(let artist):
            Text("Hello \(artist.title)")
        }
    }
}
