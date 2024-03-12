//
//  DSImage.swift
//  iOSChallenge
//
//  Created by Luis Fernando Bustos Ramírez on 13/02/24.
//

import SwiftUI
import PreviewSnapshots

public struct DSImage: View {
    
    let imageURL: String?
    
    public init(imageURL: String? = nil) {
        self.imageURL = imageURL
    }
    
    public var body: some View {
        if let urlString = imageURL {
            AsyncImage(url: URL(string: urlString), scale: 3) { phase in
                switch phase {
                case .empty:
                    ZStack {
                        Color.gray
                        ProgressView()
                    }
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                case .failure(let imageError):
                    missingImage
                        .onAppear{
                            print("for \(urlString) error:\(imageError.localizedDescription)")
                        }
                @unknown default:
                    missingImage
                }
            }
        } else {
            missingImage
        }
    }
    
    private var missingImage: some View {
        return Image(systemName: "person.crop.circle.badge.questionmark.fill")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .padding()
    }
}

struct DSImage_Previews: PreviewProvider {
    
    static var previews: some View {
        snapshots.previews.previewLayout(.sizeThatFits)
    }
    
    static var snapshots: PreviewSnapshots<String?> {
        Typography.registerFonts()
        return PreviewSnapshots(
            configurations: [
                .init(name: "Image", state: "https://www.artic.edu/iiif/2/4e0fc7a7-9c88-22a8-4a55-a31ed527473d/full/843,/0/default.jpg"),
                .init(name: "Empty Image", state: nil),
                .init(name: "Wrong url", state: "https://www.artic.edu/"),
            ],
            configure: { imageUrl in
                return DSImage(imageURL: imageUrl)
            }
        )
    }
}
