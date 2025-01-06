//
//  NewsError.swift
//  NewsApp

import Foundation

enum NewsError: Error {
    case unknown(message: String)
    case apiError
    case serviceError(message: String = "")
}
