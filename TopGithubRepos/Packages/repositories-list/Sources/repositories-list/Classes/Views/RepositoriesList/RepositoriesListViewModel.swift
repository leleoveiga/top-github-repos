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
    var page = 1
    
    init(repository: RepositoriesListRepositoryProtocol) {
        self.repository = repository
    }
    
    func getRepositories() {
        guard hasNextPage() else { return }
        let params = RepositoryListRequest(
            page: page,
            q: LanguageType.swift.asRequestParam(),
            sort: .stars
        )
        observeAPIRequest(
            from: repository.getRepositories(params: params),
            onSuccess: { [weak self] response in
                self?.page += 1
                self?.repositories.accept(response.items)
            }
        )
    }
                       
    //TODO: Pegar do header se existe o link next
    func hasNextPage() -> Bool {
        return true
    }
}

