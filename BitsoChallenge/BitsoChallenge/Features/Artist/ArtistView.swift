//
//  ArtistView.swift
//  BitsoChallenge
//
//  Created by Luis Fernando Bustos Ramírez on 12/02/24.
//

import SwiftUI
import BitsoChallengeEntities
import PreviewSnapshots
import iOSChallengeDesignSystem

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
            DSArtworkDetailView(
                image: viewModel.artistEntity.artworkImage,
                date:viewModel.artistEntity.artworkDate,
                author: viewModel.artistEntity.artistTitle,
                detail: viewModel.artistEntity.artworkDetail
            )
            if let artistTile = viewModel.artistEntity.artistTitle {
                DSArtistDetailView(
                    title: artistTile,
                    period: viewModel.artistEntity.artistBorn,
                    pseudonymous: viewModel.artistEntity.artistAltNames,
                    description: viewModel.artistEntity.artistDetail
                )
            }
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
}

struct ArtistFeatureView_Previews: PreviewProvider {
    
    static var previews: some View {
        snapshots.previews.previewLayout(.sizeThatFits)
    }
    
    static var snapshots: PreviewSnapshots<ArtistViewEntity> {
        @State var path = NavigationPath()
        BitsoChallengeApp().doDesign()
        BitsoChallengeApp().doNavigationAppearence()
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
