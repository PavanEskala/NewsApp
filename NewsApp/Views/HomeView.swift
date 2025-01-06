//
//  ContentView.swift
//  NewsApp

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel: HomeViewModel
    @ObservedObject var router = NavigationRouter()
    var body: some View {
        NavigationStack(path: $router.navigationPath) {
            VStack {
                HStack {
                    Spacer()
                    
                    Text("News App")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundStyle(Color.black)
                    
                    Spacer()
                }
                .frame(height: 60)
                .background(Color.white)
                
                ScrollView {
                    VStack(spacing: 8) {
                        if let newsItem = viewModel.newsItem?.articles {
                            ForEach(Array(newsItem.enumerated()), id: \.offset) { (index, article)in
                                NewsItemView(viewModel: NewsItemViewModel(article: article))
                                    .environmentObject(router)
                                if index != newsItem.count - 1 {
                                    Divider()
                                        .background(Color.gray.opacity(0.8))
                                        .padding(.horizontal, 10)
                                }
                            }
                        }
                    }
                    
                }
                .task {
                    do {
                        try await viewModel.loadNews() /// get News Items
                    } catch {
                        print("Error")
                    }
                    
                }
            }
            .frame(maxWidth: .infinity,maxHeight: .infinity)
            .background(Color.black.opacity(0.8))
            .navigationDestination(for: NavigationRouter.Destination.self) { destination in
                switch destination {
                case .detailScreen(let article):
                    NewsDetailsScreen(viewModel: NewsDetailsScreenViewModel(article: article))
                        .frame(maxHeight: .infinity)
                        .environmentObject(router)
                        .background(Color.black.opacity(0.8))
                    
                }
            }
        }
    }
}

#Preview {
    HomeView(viewModel: HomeViewModel())
}

