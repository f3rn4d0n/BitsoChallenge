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
    @State private var isDisabled = false
    @State private var showProgressView = false
    @ObservedObject var viewModel: ViewModel

    public init(router: Router,
                viewModel: ViewModel) {
        self.router = router
        self.viewModel = viewModel
    }

    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                Image(systemName: "globe")
                Text("Bitso:")
                    .font(.subheadline)
                    .padding()
                Button(action: {
                    Task{
                        isDisabled = true
                        showProgressView = true
                        do  {
                            try await viewModel.download()
                            path.append(ArtistsRouterEntity.detail)
                        } catch let error {
                            print("error \(error.localizedDescription)")
                        }
                        isDisabled = false
                        showProgressView = false
                    }
                }, label: {
                    ZStack {
                        Text("Download")
                            .opacity(showProgressView ? 0 : 1)
                        if showProgressView {
                            ProgressView()
                        }
                    }
                })
                .disabled(isDisabled)
                Spacer()
            }
            .navigationTitle("Artists")
            .navigationDestination(for: ArtistsRouterEntity.self) { option in
                router.goToView(for: option, path: $path)
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
