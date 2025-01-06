//
//  NomadService.swift
//  NewsPOC
//
//  Created by Mohan Sivaram Ramasamy on 08/05/24.
//

import Foundation

final class NomadService {
    static let shared = NomadService()
    
    private init() {}
    
    func loadNews() async throws -> NewsItem {
        do {
            guard let url = URL(string: NewsEndPoints.baseURL) else {
                throw NewsError.apiError
            }
            
            let request = URLRequest(url: url)
            let (data, response) = try await URLSession.shared.data(for: request)
            guard let urlResponse = response as? HTTPURLResponse else {
                throw NewsError.apiError
            }
            let statusCode = urlResponse.statusCode
            switch statusCode {
            case 200...299:
                let newsItemData = try JSONDecoder().decode(NewsItem.self, from: data)
                return newsItemData
            default: throw NewsError.apiError
            }
            
        } catch {
            print(error)
            throw error
        }
    }
    
    func getLikeCount(articleId: String) async throws -> String {
        let urlString = NewsEndPoints.likesURL + articleId
        do {
            guard let url = URL(string: urlString) else {
                throw NewsError.apiError
            }
            
            let request = URLRequest(url: url)
            let (_, response) = try await URLSession.shared.data(for: request)
            guard let urlResponse = response as? HTTPURLResponse else {
                throw NewsError.apiError
            }
            let statusCode = urlResponse.statusCode
            switch statusCode {
            case 200...299:
                return "200"
            default: throw NewsError.apiError
            }
            
        } catch {
            print(error)
            throw error
        }
    }
    
    func getCommentCount(articleId: String) async throws -> String {
        let urlString = NewsEndPoints.commentURL + articleId
        do {
            guard let url = URL(string: urlString) else {
                throw NewsError.apiError
            }
            
            let request = URLRequest(url: url)
            let (_, response) = try await URLSession.shared.data(for: request)
            guard let urlResponse = response as? HTTPURLResponse else {
                throw NewsError.apiError
            }
            let statusCode = urlResponse.statusCode
            switch statusCode {
            case 200...299:
                return "400"
            default: throw NewsError.apiError
            }
            
        } catch {
            print(error)
            throw error
        }
    }
}
