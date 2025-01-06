//
//  NewsDetailsScreenViewModel.swift
//  NewsApp


import Foundation
import Combine

class NewsDetailsScreenViewModel: ObservableObject {
    @Published var article: Article
    init(article: Article) {
        self.article = article
    }
}
