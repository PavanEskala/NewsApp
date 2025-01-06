//
//  AsyncImageLoader.swift
//  NewsApp

import SwiftUI

struct AsyncImageLoader: View {
    let url: URL?
    let placeholder: Image
    let errorImage: Image
    let cornerRadius: CGFloat = 10
    
    var body: some View {
        if let url = url {
            AsyncImage(url: url) { phase in
                switch phase {
                case .empty:
                    placeholder
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(cornerRadius)
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(cornerRadius)
                case .failure:
                    errorImage
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(cornerRadius)
                @unknown default:
                    errorImage
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(cornerRadius)
                }
            }
        } else {
            errorImage
                .resizable()
                .scaledToFit()
        }
    }
}
