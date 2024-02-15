//
//  ArtistView.swift
//  BitsoChallenge
//
//  Created by Luis Fernando Bustos Ramírez on 12/02/24.
//

import SwiftUI
import BitsoChallengeEntities
import PreviewSnapshots

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
            ArtworkImage(artworkImage: viewModel.artistEntity.artworkImage)
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

struct ArtistFeatureView_Previews: PreviewProvider {
    
    static var previews: some View {
        snapshots.previews.previewLayout(.sizeThatFits)
    }
    
    static var snapshots: PreviewSnapshots<ArtistViewEntity> {
        @State var path = NavigationPath()
        return PreviewSnapshots(
            configurations: [
                .init(name: "Emtpy Artist and Artwork", state: ArtistViewEntity.getEmtpySample()),
                .init(name: "Emtpy Artist", state: ArtistViewEntity.getEmptyArtistSample()),
                .init(name: "Emtpy Arwork", state: ArtistViewEntity.getEmptyArtworkSample()),
                .init(name: "Full data", state: ArtistViewEntity.getSample())
            ],
            configure: { artist in
                let viewModel = ArtistViewModel(dependencies: ArtistDependenciesTest.dependencies())
                viewModel.artistEntity = artist
                
                
                return NavigationStack(path: $path) {
                    ArtistView(
                       router: ArtistRouter(),
                       viewModel: viewModel,
                       path: $path
                   )
                }
                 
            }
        )
    }
}
