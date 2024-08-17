//
//  File.swift
//  repositories-list
//
//  Created by Leonardo Veiga on 17/08/24.
//

import Foundation
import core_utility
import RxSwift
import RxCocoa

class RepositoriesListViewModel: BaseViewModel {
    private let repository: RepositoriesListRepositoryProtocol
    
    let repositories: BehaviorRelay<[Repository]> = .init(value: [])
    
    init(repository: RepositoriesListRepositoryProtocol) {
        self.repository = repository
    }
    
    func getRepositories(page: Int = 1) {
        let params = RepositoryListRequest(
            page: 1,
            q: LanguageType.swift.asRequestParam(),
            sort: .stars
        )
        observeAPIRequest(
            from: repository.getRepositories(params: params),
            onSuccess: { [weak self] response in
                self?.repositories.accept(response.items)
            }
        )
    }
                       
    func hasNextPage() -> Bool {
        return true
    }
}

