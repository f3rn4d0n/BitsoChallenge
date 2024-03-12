//
//  ArtistRouter.swift
//  iOSChallenge
//
//  Created by Luis Fernando Bustos Ramírez on 12/02/24.
//

import Foundation
import SwiftUI

protocol ArtistRouterType {
    associatedtype Route
    associatedtype View: SwiftUI.View
    @ViewBuilder func goToView(for route: Route, path: Binding<NavigationPath>) -> Self.View
}

struct ArtistRouter: ArtistRouterType {
    
    func goToView(for route: ArtistRouterEntity, path: Binding<NavigationPath>) -> some View {
    }
}
