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
