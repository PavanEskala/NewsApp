//
//  NewsItemViewModel.swift
//  NewsApp


import Foundation
import Combine

class NewsItemViewModel: ObservableObject {
    @Published var article: Article
    @Published var likesCount: String = ""
    @Published var commentsCount: String = ""
    
    init(article: Article) {
        self.article = article
    }
    
    @MainActor
    func  getLikesCount() async throws {
        do {
            let articleID = getArticleID(from: article.url ?? "")
            let likesCount = try await NomadService.shared.getLikeCount(articleId: articleID)
            self.likesCount = likesCount
        } catch {
            print(error)
            throw error
        }
    }
    
    @MainActor
    func  getCommentsCount() async throws {
        do {
            let articleID = getArticleID(from: article.url ?? "")
            let commentsCount = try await NomadService.shared.getCommentCount(articleId: articleID)
            self.commentsCount = commentsCount
        } catch {
            print(error)
            throw error
        }
    }
    
    private func getArticleID(from url: String) -> String {
        guard let urlComponents = URL(string: url) else { return "" }
        
        // Remove the scheme (e.g., "https://")
        guard let hostAndPath = urlComponents.host.flatMap({ host in
            urlComponents.path.isEmpty ? host : "\(host)\(urlComponents.path)"
        }) else { return "" }
        
        // Replace "/" with "-"
        let articleID = hostAndPath.replacingOccurrences(of: "/", with: "-")
        return "https://" + articleID
    }
}
