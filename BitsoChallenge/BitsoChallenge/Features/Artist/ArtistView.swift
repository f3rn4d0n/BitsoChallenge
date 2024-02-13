//
//  ArtistView.swift
//  BitsoChallenge
//
//  Created by Luis Fernando Bustos Ramírez on 12/02/24.
//

import SwiftUI

struct ArtistView<ViewModel: ArtistViewModel, Router: ArtistRouterType>: View where Router.Route == ArtistRouterEntity {
    
    private let router: Router
    @State private var isDisabled = false
    @State private var showProgressView = false
    @ObservedObject var viewModel: ViewModel
    @Binding var path: NavigationPath

    public init(router: Router,
                viewModel: ViewModel,
                path: Binding<NavigationPath>) {
        self.router = router
        self.viewModel = viewModel
        self._path = path
    }

    var body: some View {
        VStack {
            Text("Working:")
                .font(.subheadline)
                .padding()
                .onAppear{
                    Task{
                        await viewModel.getInfo()
                    }
                }
            Spacer()
        }
        .navigationTitle(viewModel.artistEntity.artworkTitle)
    }
}

#Preview {
    @State var path = NavigationPath()
    return ArtistView(
        router: ArtistRouter(),
        viewModel: ArtistViewModel(
            dependencies: .init(
                artwork: .init(id: 1, title: "", description: "", image: nil, artist: nil, artistId: nil),
                useCase: GetArtistUseCase(remoteDataSource: ArtworksApi.shared)
            )
        ),
        path: $path
    )
}
