//
//  NewsDetailsScreen.swift
//  NewsApp


import SwiftUI

struct NewsDetailsScreen: View {
    var viewModel: NewsDetailsScreenViewModel
    @EnvironmentObject var router: NavigationRouter
    var body: some View {
        ZStack(alignment: .top) {
            VStack(spacing: 12) {
                AsyncImageLoader(url: URL(string: viewModel.article.urlToImage ?? ""), placeholder: Image(systemName: "photo"), errorImage: Image(systemName: "exclamationmark.triangle"))
                    .padding(.all, 10)
                
                buildTitleView()
                    .overlay {
                        RoundedRectangle(cornerRadius: 8).stroke(Color.white, lineWidth: 1.5)
                    }
                    .padding(.horizontal, 10)
                Text(viewModel.article.descriptionField ?? "")
                    .font(.system(size: 24, weight: .thin))
                    .foregroundColor(Color.white)
                    .padding(.horizontal, 10)
                
                Spacer()
            }
        }
        .navigationBarBackButtonHidden(true) // Hide the default back button
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    router.navigateBack()
                }) {
                    HStack {
                        /// Custom back Button
                        Image(systemName: "chevron.left")
                            .foregroundStyle(Color.white)
                        Text("Back")
                            .foregroundStyle(Color.white)
                    }
                }
            }
        }
    }
    
    @ViewBuilder func buildTitleView() -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(viewModel.article.title)
                .font(.system(size: 16, weight: .semibold))
                .foregroundColor(Color.white.opacity(0.8))
                .padding(.horizontal, 4)
                .padding(.top, 8)
            HStack(spacing: 4) {
                Text(viewModel.article.source?._name ?? "")
                    .font(.system(size: 12))
                    .foregroundColor(Color.white.opacity(0.8))
                    .padding(.leading, 4)
                
                Text(".")
                    .font(.system(size: 12))
                    .foregroundColor(Color.white.opacity(0.8))
                
                Text(viewModel.article.publishedAt ?? "")
                    .font(.system(size: 12))
                    .foregroundColor(Color.white.opacity(0.8))
            }
            .padding(.bottom, 8)
        }
    }
}

