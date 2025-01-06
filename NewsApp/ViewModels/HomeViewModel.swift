//
//  HomeViewModel.swift
//  NewsApp


import Foundation
import Combine

class HomeViewModel: ObservableObject {
    @Published var newsItem: NewsItem?

    init() { }

    @MainActor
    func loadNews() async throws {
        do {
            let newsItem = try await NomadService.shared.loadNews()
            self.newsItem = newsItem
        } catch {
            print(error)
            throw error
        }
    }
}
