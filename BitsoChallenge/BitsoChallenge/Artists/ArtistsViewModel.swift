//
//  ArtistsViewModel.swift
//  BitsoChallenge
//
//  Created by Luis Fernando Bustos Ramírez on 08/02/24.
//

import SwiftUI

public final class ArtistsViewModel: ArtistsViewModelType {

    private let dependencies: ArtistsDependencies

    public init(dependencies: ArtistsDependencies) {
        self.dependencies = dependencies
    }

    public func download() async throws -> Void {
        return
    }
}
