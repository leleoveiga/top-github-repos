//
//  RepositoriesListRepository.swift
//  repositories-list
//
//  Created by Leonardo Veiga on 16/08/24.
//

import Foundation
import core_utility
import core_network
import RxSwift


class RepositoriesListRepository: RepositoriesListRepositoryProtocol {
    func getRepositories(params: RepositoryListRequest) -> Single<RepositoryListResponse> {
        return NetworkManager.shared.request(Endpoint.searchRepositories,
                                             parameters: params.dictionary)
    }
}

protocol RepositoriesListRepositoryProtocol  {
    func getRepositories(params: RepositoryListRequest) -> Single<RepositoryListResponse>
}

class RepositoriesListRepositoryMock: RepositoriesListRepositoryProtocol {
    func getRepositories(params: RepositoryListRequest) -> Single<RepositoryListResponse> {
        return Single.just(.with())
    }
}
