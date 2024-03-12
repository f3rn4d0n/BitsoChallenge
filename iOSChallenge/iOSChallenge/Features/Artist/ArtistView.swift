//
//  ArtistView.swift
//  iOSChallenge
//
//  Created by Luis Fernando Bustos Ramírez on 12/02/24.
//

import SwiftUI
import iOSChallengeEntities
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
        ZStack {
            VStack {
                DSArtworkDetailView(
                    image: viewModel.artistEntity.artworkImage,
                    date:viewModel.artistEntity.artworkDate,
                    author: viewModel.artistEntity.artworkAuthor,
                    detail: viewModel.artistEntity.artworkDetail
                )
                if viewModel.artistEntity.isLoading {
                    ProgressView()
                } else {
                    if viewModel.artistEntity.artworkDetailNotEmpty {
                        DSArtistDetailView(
                            title: viewModel.artistEntity.artworkAuthor,
                            period: viewModel.artistEntity.artistBorn,
                            pseudonymous: viewModel.artistEntity.artistAltNames,
                            description: viewModel.artistEntity.artistDetail
                        )
                    } else {
                        Text("Unknown author detail")
                            .font(Typography.boldM.font)
                            .foregroundStyle(DSColor.primary)
                    }
                }
                Spacer()
            }
            .onAppear{
                Task{
                    await viewModel.getInfo()
                }
            }
            if let error = viewModel.artistEntity.error {
                DSErrorAlert(error: error)
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
        iOSChallengeApp().doDesign()
        iOSChallengeApp().doNavigationAppearence()
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
