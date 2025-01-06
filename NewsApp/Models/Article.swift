//
//  Article.swift
//  NewsApp


import Foundation


struct Article : Codable {
    let author : String?
    let content : String?
    let descriptionField : String?
    let publishedAt : String?
    let source : CustomSource?
    let title : String
    let url : String?
    let urlToImage : String?

    enum CodingKeys: String, CodingKey {
        case author = "author"
        case content = "content"
        case descriptionField = "description"
        case publishedAt = "publishedAt"
        case source = "source"
        case title = "title"
        case url = "url"
        case urlToImage = "urlToImage"
    }
}

extension Article: Identifiable, Hashable {
    var id: String {
        author ?? ""
    }
}
