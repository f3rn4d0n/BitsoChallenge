//
//  ArtistsView.swift
//  BitsoChallenge
//
//  Created by Luis Fernando Bustos Ramírez on 08/02/24.
//

import SwiftUI

struct ArtistsView<ViewModel: ArtistsViewModel, Router: ArtistsRouterType>: View where Router.Route == ArtistsRouterEntity {
    
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
                ForEach(viewModel.artists) { artist in
                    Button {
                        path.append(ArtistsRouterEntity.detail(artist: artist))
                    } label: {
                        Text("Artist: \(artist.title)")
                    }
                    .onAppear {
                        Task{
                            await viewModel.download(currentArtist: artist)
                        }
                    }
                }
            }
            .refreshable {
                Task{
                    await viewModel.download(currentArtist: nil)
                }
            }
            .navigationDestination(for: ArtistsRouterEntity.self) { option in
                router.goToView(for: option, path: $path)
            }
            .navigationTitle("Artists")
            .overlay {
                if viewModel.artists.isEmpty {
                    ContentUnavailableView {
                        Label("No aritst founded", systemImage: "book.fill")
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
    return ArtistsView(
        router: ArtistsRouter(),
        viewModel: ArtistsViewModel(dependencies: .init())
    )
}
