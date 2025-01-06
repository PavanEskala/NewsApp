//
//  NewsItem.swift
//  NewsApp


import Foundation

struct NewsItem : Codable {
    let articles : [Article]?
    let status : String?
    let totalResults : Int?
    
    enum CodingKeys: String, CodingKey {
        case articles = "articles"
        case status = "status"
        case totalResults = "totalResults"
    }
}
