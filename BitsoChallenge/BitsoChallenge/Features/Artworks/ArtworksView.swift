//
//  ArtworksView.swift
//  BitsoChallenge
//
//  Created by Luis Fernando Bustos Ramírez on 08/02/24.
//

import SwiftUI
import BitsoChallengeEntities

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
                    artworkView(artwork)
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
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        Task {
                            await viewModel.clearDataBase()
                        }
                    } label: {
                        Image(systemName: "trash.fill")
                            .tint(.red)
                    }
                }
                if viewModel.isLoading {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        ProgressView()
                    }
                }
            }
            .overlay {
                if viewModel.artworks.isEmpty {
                    ContentUnavailableView {
                        Label("No artworks founded", systemImage: "book.fill")
                    } description: {
                        Text("Pull to refresh")
                    }
                    .onAppear {
                        Task{
                            await viewModel.requestLocalArtworks()
                        }
                    }
                }
            }
        }
    }
    
    func artworkView(_ artwork: Artwork) -> some View {
        Button {
            path.append(ArtworksRouterEntity.detail(artwork: artwork))
        } label: {
            HStack {
                ArtworkImage(artworkImage: artwork.thumbnail)
                    .frame(width: 40, height: 40)
                Text("\(artwork.title)")
                    .font(.callout)
                    .foregroundStyle(.black)
            }
        }
    }
}

#Preview {
    @State var path = NavigationPath()
    
    return ArtworksView(
        router: ArtworksRouter(),
        viewModel: ArtworksViewModel(
            dependencies: ArtworksDependenciesTest.dependencies()
        )
    )
}
