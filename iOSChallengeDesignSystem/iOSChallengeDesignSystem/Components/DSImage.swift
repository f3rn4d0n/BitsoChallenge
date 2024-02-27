//
//  DSImage.swift
//  BitsoChallenge
//
//  Created by Luis Fernando Bustos Ramírez on 13/02/24.
//

import SwiftUI

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
    DSImage(
        imageURL: "https://www.artic.edu/iiif/2/4e0fc7a7-9c88-22a8-4a55-a31ed527473d/full/843,/0/default.jpg"
    )
}
