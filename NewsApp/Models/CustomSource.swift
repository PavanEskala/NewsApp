//
//  CustomSource.swift
//  NewsApp

import Foundation

struct CustomSource : Codable {
    let Sid : String?
    let _name : String?

    enum CodingKeys: String, CodingKey {
        case Sid = "id"
        case _name = "name"
    }
}

extension CustomSource: Identifiable, Hashable {
    var id: String {
        Sid ?? ""
    }
}
