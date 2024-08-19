//
//  PullRequestListRepository.swift
//  repositories-list
//
//  Created by Leonardo Veiga on 16/08/24.
//

import Foundation
import core_utility
import core_network
import RxSwift


class PullRequestListRepository: PullRequestListRepositoryProtocol {
    func getPullRequests(params: PullRequestListRequest) -> Single<PullRequestListResponse> {
        var ep = Endpoint.repositoryDetails.formatQueryEndpoint(params: params)
        return NetworkManager.shared.request(ep)
    }
}

protocol PullRequestListRepositoryProtocol  {
    func getPullRequests(params: PullRequestListRequest) -> Single<PullRequestListResponse>
}
