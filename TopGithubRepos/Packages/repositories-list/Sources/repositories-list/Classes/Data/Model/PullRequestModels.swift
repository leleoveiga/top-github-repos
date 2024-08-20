//
//  PullRequestsModels.swift
//  repositories-list
//
//  Created by Leonardo Veiga on 18/08/24.
//

import Foundation

struct PullRequestListRequest: Codable {
    let author: String
    let repositoryName: String
}

typealias PullRequestListResponse = [PullRequestItem]

struct PullRequestItem: Codable {
    let title: String
    let body: String?
    let createdAt: String
    var date: Date? {
        createdAt.getDate(.yyyyMMddTHHmmssZ)
    }
    let user: PullRequestOwner
    let htmlUrl: String

    enum CodingKeys: String, CodingKey {
        case title
        case body
        case createdAt = "created_at"
        case user
        case htmlUrl = "html_url"
    }
}

struct PullRequestOwner: Codable {
    let name: String
    let avatarUrl: String?
    
    enum CodingKeys: String, CodingKey {
        case name = "login"
        case avatarUrl = "avatar_url"
    }
}

extension PullRequestListResponse {
    static func with(_ items: [PullRequestItem] = .init(repeating: .with(), count: 10)) -> PullRequestListResponse {
        items
    }
}

extension PullRequestItem {
    static func with(
        title: String = "add a default disposebag to every subscribe",
        body: String = "i want to add a default disposebag to every subscribe to make it easier to type because i have a lot of subscribe and i don't want to write disposed(by: disposeBag) every time",
        createdAt: String = "2024-08-20T11:29:44Z",
        user: PullRequestOwner = .with(),
        htmlUrl: String = "https://github.com/ReactiveX/RxSwift/pull/2620"
    ) -> PullRequestItem {
        .init(title: title,
              body: body,
              createdAt: createdAt,
              user: user,
              htmlUrl: htmlUrl
        )
    }
}

extension PullRequestOwner {
    static func with(name: String = "leleoveiga",
                     avatarUrl: String? = nil) -> PullRequestOwner {
        .init(name: name, avatarUrl: avatarUrl)
    }
}
