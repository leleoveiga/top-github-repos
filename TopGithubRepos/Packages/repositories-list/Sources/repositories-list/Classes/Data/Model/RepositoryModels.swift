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
        case page
        case q
        case sort
    }
}

// MARK: - RepositoryListResponse
struct RepositoryListResponse: Codable {
    let items: [Repository]
    
    enum CodingKeys: String, CodingKey {
        case items
    }
}

// MARK: - Item
struct Repository: Codable {
    let name: String
    let fullName: String
    let description: String?
    let owner: Owner
    let stargazersCount: Int
    let forks: Int
    let language: LanguageType
    
    enum CodingKeys: String, CodingKey {
        case name
        case fullName = "full_name"
        case description
        case forks
        case owner
        case stargazersCount = "stargazers_count"
        case language
    }
}

// MARK: - Owner
struct Owner: Codable {
    let login: String
    let avatarUrl: String?
    
    enum CodingKeys: String, CodingKey {
        case login
        case avatarUrl = "avatar_url"
    }
}

enum SortType: String, Codable {
    case stars
    case forks
}

enum LanguageType: String, Codable {
    case swift = "Swift"
    case kotlin = "Kotlin"
    
    var languageFilterPrefix: String {
        return "language:"
    }
    
    func asRequestParam() -> String {
        return languageFilterPrefix + rawValue
    }
}

extension RepositoryListResponse {
    static var mockDescOrder: [Repository] {
        var list: [Repository] = []
        for i in (0..<10).reversed() {
            let repository = Repository.with(name: "Repository \(i)",fullName: "Full Name \(i)",
                                             description: "Description \(i)",
                                             stargazersCount: i * 10,
                                             forks: i * 20)
            list.append(repository)
        }
        return list
    }
    static func with(
        items: [Repository] = mockDescOrder
    ) -> RepositoryListResponse {
        .init(items: items)
    }
}

extension Repository {
    static func with(
        name: String = "RxSwift",
        fullName: String = "ReactiveX/RxSwift",
        description: String = "Reactive Programming in Swift",
        owner: Owner = Owner.with(),
        stargazersCount: Int = 500,
        forks: Int = 200,
        language: LanguageType = .swift
    ) -> Repository {
        .init(name: name,
                   fullName: fullName,
                   description: description,
                   owner: owner,
                   stargazersCount: stargazersCount,
                   forks: forks,
                   language: language)
    }
}

extension Owner {
    static func with(
        login: String = "ReactiveX",
        avatarUrl: String = "https://avatars.githubusercontent.com/u/6407041"
    ) -> Owner {
        .init(login: login, avatarUrl: avatarUrl)
    }
}
