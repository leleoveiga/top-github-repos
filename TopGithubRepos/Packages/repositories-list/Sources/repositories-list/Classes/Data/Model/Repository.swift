//
//  Repository.swift
//  repositories-list
//
//  Created by Leonardo Veiga on 16/08/24.
//

import Foundation

struct RepositoryListRequest: Codable {
    let page: Int
    let q: String
    let sort: SortType
    
    enum CodingKeys: String, CodingKey {
        case page = "page"
        case q = "q"
        case sort = "sort"
    }
}

// MARK: - RepositoryListResponse
struct RepositoryListResponse: Codable {
    let items: [Repository]
    
    enum CodingKeys: String, CodingKey {
        case items = "items"
    }
}

// MARK: - Item
struct Repository: Codable {
    let name: String
    let description: String
    let owner: Owner
    let stargazersCount: Int
    let forks: Int
    
    enum CodingKeys: String, CodingKey {
        case name = "full_name"
        case description = "description"
        case forks = "forks"
        case owner = "owner"
        case stargazersCount = "stargazers_count"
    }
}

// MARK: - Owner
struct Owner: Codable {
    let login: String
    let avatarUrl: String
    
    enum CodingKeys: String, CodingKey {
        case login = "login"
        case avatarUrl = "avatar_url"
    }
}

enum SortType: String, Codable {
    case stars = "stars"
    case forks = "forks"
}

enum LanguageType: String, Codable {
    case swift
    case kotlin
    
    var languageFilterPrefix: String {
        return "language:"
    }
    
    func asRequestParam() -> String {
        return languageFilterPrefix + rawValue
    }
}
