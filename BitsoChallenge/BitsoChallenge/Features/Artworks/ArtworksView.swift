//
//  ArtworksView.swift
//  BitsoChallenge
//
//  Created by Luis Fernando Bustos Ramírez on 08/02/24.
//

import SwiftUI
import BitsoChallengeEntities
import PreviewSnapshots
import iOSChallengeDesignSystem

struct ArtworksView<ViewModel: ArtworksViewModel, Router: ArtworksRouterType>: View where Router.Route == ArtworksRouterEntity {
    
    private let router: Router
    @State var path = NavigationPath()
    @ObservedObject var viewModel: ViewModel
    
    public init(router: Router,
                viewModel: ViewModel) {
        self.router = router
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationStack(path: $path) {
            List {
                ForEach(data: viewModel.model.artworks) { index, artwork in
                    DSCellView(
                        title: artwork.title,
                        message: artwork.description,
                        imageURL: artwork.thumbnail,
                        style: index % 2 == 0 ? .primary : .secondary) {
                            path.append(ArtworksRouterEntity.detail(artwork: artwork))
                        }
                        .onAppear {
                            Task{
                                await viewModel.downloadArtworks(current: artwork)
                            }
                        }
                }
            }
            .refreshable {
                Task{
                    await viewModel.reloadArtworks()
                }
            }
            .navigationDestination(for: ArtworksRouterEntity.self) { option in
                router.goToView(for: option, path: $path)
            }
            .navigationTitle("Artworks")
            .toolbar {
                if viewModel.model.isLoading {
                    ToolbarItem(placement: .navigationBarLeading) {
                        ProgressView()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    if !viewModel.model.artworks.isEmpty {
                        DSButton(style: .tertiary, icon: Image(systemName: "trash.fill"), message: "Clear") {
                            Task {
                                await viewModel.clearDataBase()
                            }
                        }
                    }
                }
            }
            .overlay {
                if viewModel.model.artworks.isEmpty {
                    DSContentUnavailableView(
                        title: "No artworks founded",
                        systemImage: "book.fill",
                        description: "Pull to refresh"
                    )
                    .onAppear {
                        Task{
                            await viewModel.requestLocalArtworks()
                        }
                    }
                }
            }
        }
    }
}

struct ArtworksFeatureView_Previews: PreviewProvider {
    
    static var previews: some View {
        snapshots.previews.previewLayout(.sizeThatFits)
    }
    
    static var snapshots: PreviewSnapshots<[Artwork]> {
        PreviewSnapshots(
            configurations: [
                .init(name: "Emtpy Artworks List", state: []),
                .init(name: "Full loads", state: Artwork.getSample())
            ],
            configure: { artworks in
                let dependencies = ArtworksDependenciesTest.dependencies()
                let viewModel = ArtworksViewModel(dependencies: dependencies)
                viewModel.model.artworks = artworks
                let router = ArtworksRouter()
                return ArtworksView(router: router, viewModel: viewModel)
            }
        )
    }
}
