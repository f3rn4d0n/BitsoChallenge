//
//  ArtworksView.swift
//  BitsoChallenge
//
//  Created by Luis Fernando Bustos Ramírez on 08/02/24.
//

import SwiftUI

struct ArtworksView<ViewModel: ArtworksViewModel, Router: ArtworksRouterType>: View where Router.Route == ArtworksRouterEntity {
    
    private let router: Router
    @State var path  = NavigationPath()
    @ObservedObject var viewModel: ViewModel

    public init(router: Router,
                viewModel: ViewModel) {
        self.router = router
        self.viewModel = viewModel
    }
 
    var body: some View {
        NavigationStack(path: $path) {
            List {
                ForEach(viewModel.artworks) { artwork in
                    Button {
                        path.append(ArtworksRouterEntity.detail(artwork: artwork))
                    } label: {
                        Text("Title: \(artwork.title)")
                    }
                    .onAppear {
                        Task{
                            await viewModel.download(currentArtwork: artwork)
                        }
                    }
                }
            }
            .refreshable {
                Task{
                    await viewModel.download(currentArtwork: nil)
                }
            }
            .navigationDestination(for: ArtworksRouterEntity.self) { option in
                router.goToView(for: option, path: $path)
            }
            .navigationTitle("Artworks")
            .overlay {
                if viewModel.artworks.isEmpty {
                    ContentUnavailableView {
                        Label("No artworks founded", systemImage: "book.fill")
                    } description: {
                        Text("Pull to refresh")
                    }
                }
            }
        }
    }
}

#Preview {
    @State var path = NavigationPath()
    return ArtworksView(
        router: ArtworksRouter(),
        viewModel: ArtworksViewModel(
            dependencies: .init(useCase: GetArtworksUseCase(remoteDataSource: ArtworksApi.shared))
        )
    )
}
