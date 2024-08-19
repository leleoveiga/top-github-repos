//
//  RepositoriesListViewModel.swift
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
    
    var selectedLanguage: BehaviorRelay<LanguageType> = .init(value: .swift)
    let repositories: BehaviorRelay<[Repository]> = .init(value: [])
    let repositoriesFiltered: BehaviorRelay<[Repository]> = .init(value: [])
    var page = 1
    
    init(repository: RepositoriesListRepositoryProtocol) {
        self.repository = repository
    }
    
    func getRepositories() {
        guard hasNextPage() else { return }
        let params = RepositoryListRequest(
            page: page,
            q: selectedLanguage.value.asRequestParam(),
            sort: .stars
        )
        observeAPIRequest(
            from: repository.getRepositories(params: params),
            onSuccess: { [weak self] response in
                self?.page += 1
                self?.repositories.append(contentsOf: (response.items))
                self?.resetSearch()
            }
        )
    }
    
    func filterRepositories(substring: String) {
        let filteredRepositories = repositories.value.filter { repo in
            let name = repo.name.lowercased()
            return name.contains(substring.lowercased())
        }
        repositoriesFiltered.accept(filteredRepositories)
    }
    
    func resetSearch() {
        repositoriesFiltered.accept(repositories.value.map { $0 })
    }
                       
    //TODO: Pegar do header se existe o link next
    func hasNextPage() -> Bool {
        return true
    }
}

