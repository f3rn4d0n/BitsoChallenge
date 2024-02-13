//
//  ArtworkImage.swift
//  BitsoChallenge
//
//  Created by Luis Fernando Bustos Ramírez on 13/02/24.
//

import SwiftUI

struct ArtworkImage: View {
    
    let artworkImage: String?
    
    var body: some View {
        if let urlString = artworkImage {
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
                    Image(systemName: "person.crop.circle.badge.questionmark.fill")
                        .resizable()
                        .padding()
                }
            }
        } else {
            Image(systemName: "person.crop.circle.badge.questionmark.fill")
                .resizable()
                .padding()
        }
    }
}

#Preview {
    ArtworkImage(artworkImage: "https://www.artic.edu/iiif/2/4e0fc7a7-9c88-22a8-4a55-a31ed527473d/full/843,/0/default.jpg")
}
