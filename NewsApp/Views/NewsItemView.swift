//
//  NewsItemView.swift
//  NewsApp


import SwiftUI

struct NewsItemView: View {
    @EnvironmentObject var router: NavigationRouter
    var viewModel: NewsItemViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            VStack {
                AsyncImageLoader(url: URL(string: viewModel.article.urlToImage ?? ""), placeholder: Image(systemName: "photo"), errorImage: Image(systemName: "exclamationmark.triangle"))
                    .padding(.all, 10)
                
                Text(viewModel.article.title)
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundStyle(Color.white)
                    .padding(.horizontal, 10)
            }.onTapGesture {
                router.navigate(to: .detailScreen(article: viewModel.article))
            }
            
            HStack {
                if let author = viewModel.article.author {
                    Text( "Author: " + author)
                        .font(.system(size: 13))
                        .foregroundStyle(Color.white.opacity(0.85))
                        .lineLimit(1)
                        .padding(.horizontal, 10)
                 }
                
                Spacer()
                
                HStack {
                    Text(viewModel.likesCount)
                        .task {
                            do {
                                try await viewModel.getLikesCount() /// get Likes Count
                            } catch {
                                print("Error")
                            }
                        }
                    Image(systemName: "hand.thumbsup.fill")
                        .foregroundStyle(Color.white)
                }
                
                HStack {
                    Text(viewModel.commentsCount)
                        .task {
                        do {
                            try await viewModel.getCommentsCount() /// get Comments Count
                        } catch {
                            print("Error")
                        }
                    }
                    Image(systemName: "ellipsis.message.fill")
                        .foregroundStyle(Color.white)
                }
            }
        }
        
    }
}
