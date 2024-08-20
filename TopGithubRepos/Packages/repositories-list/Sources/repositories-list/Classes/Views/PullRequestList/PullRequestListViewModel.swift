//
//  PullRequestListViewModel.swift
//  repositories-list
//
//  Created by Leonardo Veiga on 17/08/24.
//

import Foundation
import core_utility
import RxSwift
import RxCocoa

class PullRequestListViewModel: BaseViewModel {
    private let repository: PullRequestListRepository
    
    let pullRequests: BehaviorRelay<[PullRequestItem]> = .init(value: [])
    let pullRequestsFiltered: BehaviorRelay<[PullRequestItem]> = .init(value: [])
    let isPullRequestListEmpty: PublishSubject<Bool> = .init()
    let selectedRepository: Repository
    
    init(repository: PullRequestListRepository, gitRepository: Repository) {
        self.repository = repository
        self.selectedRepository = gitRepository
    }
    
    func getPullRequests() {
        let author = selectedRepository.owner.login
        let repositoryName = selectedRepository.name
        let params = PullRequestListRequest(author: author, repositoryName: repositoryName)
        
        observeAPIRequest(
            from: repository.getPullRequests(params: params),
            onSuccess: { [weak self] response in
                self?.pullRequests.append(contentsOf: (response))
                self?.isPullRequestListEmpty.onNext(response.count == 0)
                self?.resetSearch()
            }
        )
    }
    
    func filterPullRequests(substring: String) {
        let filteredPullRequests = pullRequests.value.filter { pr in
            let name = pr.title.lowercased()
            let author = pr.user.name.lowercased()
            return name.contains(substring.lowercased()) || author.contains(substring.lowercased())
        }
        pullRequestsFiltered.accept(filteredPullRequests)
    }
    
    func resetSearch() {
        pullRequestsFiltered.accept(pullRequests.value.map { $0 })
    }
}

