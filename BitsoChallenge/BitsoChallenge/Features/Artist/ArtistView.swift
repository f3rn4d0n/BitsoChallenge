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
            artworkImage
                .frame(width: 250, height: 250)
            subtitleView
            artworkDescriptionView
            artistView
            Spacer()
        }
        .onAppear{
            Task{
                await viewModel.getInfo()
            }
        }
        .navigationTitle(viewModel.artistEntity.artworkTitle)
        .navigationBarTitleDisplayMode(.inline)
    }
    
    @ViewBuilder
    var artworkImage: some View {
        if let urlString = viewModel.artistEntity.artworkImage {
            AsyncImage(url: URL(string: urlString), scale: 3) { phase in
                switch phase {
                case .empty:
                    ZStack {
                        Color.gray
                        ProgressView()
                    }
                case .success(let image):
                    image.resizable()
                case .failure(let imageError):
                    Image(systemName: "person.crop.circle.badge.questionmark.fill")
                        .resizable()
                        .padding()
                        .onAppear{
                            print("for \(urlString) error:\(imageError.localizedDescription)")
                        }
                @unknown default:
                    EmptyView()
                }
            }
        } else {
            Image(systemName: "person.crop.circle.badge.questionmark.fill")
                .padding()
        }
    }
    
    @ViewBuilder
    var subtitleView: some View {
        if let date = viewModel.artistEntity.artworkDate {
            Text("At: \(date)")
                .font(.footnote)
        } else {
            Text("At: Unknow date")
                .font(.footnote)
        }
        if let artistTile = viewModel.artistEntity.artistTitle {
            Text("By: \(artistTile)")
                .font(.headline)
                .padding(.top, 10)
        }
    }
    
    @ViewBuilder
    var artworkDescriptionView: some View {
        Text(viewModel.artistEntity.artworkDetail)
            .font(.body)
            .padding()
    }
    
    @ViewBuilder
    var artistView: some View {
        if let artistTile = viewModel.artistEntity.artistTitle {
            Divider()
            if let birth = viewModel.artistEntity.artistBorn {
                Text("\(artistTile): \(birth)")
                    .font(.callout)
            }
            if let altNames = viewModel.artistEntity.artistAltNames {
                Text("Other artist names:")
                    .font(.caption)
                    .padding()
                Text(altNames)
                    .font(.caption)
            }
        }
    }
}

#Preview {
    @State var path = NavigationPath()
    return ArtistView(
        router: ArtistRouter(),
        viewModel: ArtistViewModel(
            dependencies: .init(
                artwork: .init(id: 1, title: "", description: "", date: nil, image: nil, thumbnail: nil, artist: nil, artistId: nil),
                useCase: GetArtistUseCase(remoteDataSource: ArtworksApi.shared)
            )
        ),
        path: $path
    )
}
