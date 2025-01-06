//
//  NavigationManager.swift
//  NewsApp

import Foundation
import SwiftUI

/// NavigationRouter to navigate from one view to another.
final class NavigationRouter: ObservableObject {
    
    enum Destination: Codable, Hashable {
        case detailScreen(article: Article)

        public static func == (lhs: Destination, rhs: Destination) -> Bool {
            switch (lhs, rhs) {
            case (.detailScreen(let lhsArticle), .detailScreen(let rhsArticle)):
                return lhsArticle.title == rhsArticle.title
            }
        }

        public func hash(into hasher: inout Hasher) {
            switch self {
            case .detailScreen(let article):
                hasher.combine(article.title)
            }
        }
    }

    @Published var navigationPath: NavigationPath = NavigationPath()

    /// To Navigate to destinated View
    func navigate(to destination: Destination) {
        navigationPath.append(destination)
    }
    /// To Navigate back to previous/ last View
    func navigateBack() {
        navigationPath.removeLast()
    }
    /// To Navigate back to Root View
    func navigateToRoot() {
        navigationPath.removeLast(navigationPath.count)
    }
}
