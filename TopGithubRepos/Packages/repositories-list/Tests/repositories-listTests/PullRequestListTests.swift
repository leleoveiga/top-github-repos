//
//  PullRequestListTests.swift
//  repositories-list
//
//  Created by Leonardo Veiga on 20/08/24.
//

import XCTest
@testable import repositories_list
@testable import RxSwift
@testable import class core_utility.MockUtils

final class PullRequestList: XCTestCase {
    var viewModel: PullRequestListViewModel!
    var disposeBag: DisposeBag!
    override func setUp() {
        disposeBag = DisposeBag()
        viewModel = PullRequestListViewModel(repository: PullRequestListRepositoryMock(), gitRepository: .with())
    }
    
    override func tearDown() {
        viewModel = nil
    }
    
    func testNoAPIKeyProvided() {
        let apiKey = ProcessInfo.processInfo.environment["API_KEY"]
        if apiKey?.isEmpty ?? true {
            XCTFail("No API key provided")
        }
        XCTAssertFalse(apiKey?.isEmpty ?? true)
    }
    
    func testGetPullRequestsMock() {
        let prsFromSelectedRepo = expectation(description: "Mocked PullRequests are from the desired repository")
        viewModel.selectedRepository = .with()
        
        viewModel.pullRequests
            .skip(1)
            .subscribe(onNext: { prs in
                XCTAssertTrue(prs.count >= 0)
                let sameRepository = prs.allSatisfy { pr in
                    let repoOwnerName = self.viewModel.selectedRepository.name.lowercased()
                    return pr.htmlUrl.lowercased().contains(repoOwnerName.lowercased())
                }
                XCTAssertTrue(sameRepository)
                prsFromSelectedRepo.fulfill()
            })
            .disposed(by: disposeBag)
        
        viewModel.getPullRequests()
        wait(for: [prsFromSelectedRepo], timeout: 10)
    }
    
    func testGetPullRequests() {
        let prsFromSelectedRepo = expectation(description: "PullRequests are from the desired repository")
        viewModel = .init(repository: PullRequestListRepository(), gitRepository: .with())
        
        viewModel.pullRequests
            .skip(1)
            .subscribe(onNext: { prs in
                XCTAssertTrue(prs.count >= 0)
                let sameRepository = prs.allSatisfy { pr in
                    let repoOwnerName = self.viewModel.selectedRepository.name.lowercased()
                    return pr.htmlUrl.lowercased().contains(repoOwnerName.lowercased())
                }
                XCTAssertTrue(sameRepository)
                prsFromSelectedRepo.fulfill()
            })
            .disposed(by: disposeBag)
        
        viewModel.getPullRequests()
        wait(for: [prsFromSelectedRepo], timeout: 10)
    }
    
    func testFilterBySearchTerm() {
        let filterExpectation = expectation(description: "PullRequest filtered by search term")
        let resetFilterExpectation = expectation(description: "Reset filter to all pullRequests")
        
        let searchTerm: PublishSubject<String> = .init()
        viewModel.pullRequests
            .subscribe(onNext: { pullRequests in
                searchTerm.onNext(pullRequests.first?.title ?? "")
            })
            .disposed(by: disposeBag)
        
        searchTerm.subscribe(onNext: { term in
            self.viewModel.filterPullRequests(substring: term)
            
            let validFiltering = self.viewModel.pullRequestsFiltered.value.allSatisfy { repo in
                repo.title.lowercased().contains(term.lowercased())
            }
            XCTAssertTrue(validFiltering)
            filterExpectation.fulfill()
            
            self.viewModel.resetSearch()
            XCTAssertEqual(self.viewModel.pullRequests.value.count, self.viewModel.pullRequestsFiltered.value.count)
            resetFilterExpectation.fulfill()
        })
        .disposed(by: disposeBag)
        
        viewModel.getPullRequests()
        wait(for: [filterExpectation, resetFilterExpectation], timeout: 10)
    }
    
    func testDate() {
        let dateString = "2024-08-17T09:34:25Z"
        
        let date = dateString.getDate(.yyyyMMddTHHmmssZ)
        XCTAssertEqual(date?.description, "2024-08-17 09:34:25 +0000")
        
        let jsonString = "{\"body\":\"i want to add a default disposebag to every subscribe to make it easier to type because i have a lot of subscribe and i don\'t want to write disposed(by: disposeBag) every time\",\"title\":\"add a default disposebag to every subscribe\",\"user\":{\"login\":\"leleoveiga\"},\"html_url\":\"https:\\/\\/github.com\\/ReactiveX\\/RxSwift\\/pull\\/2620\",\"created_at\":\"2024-08-17T09:34:25Z\"}"
        let prFromJson: PullRequestItem? = MockUtils.extractModelFrom(json: jsonString)
        XCTAssertEqual(prFromJson?.date, dateString.getDate(.yyyyMMddTHHmmssZ))
    }
    
    func testFormatQueryEndpoint() {
        let correctEndpoint = "repos/ReactiveX/RxSwift/pulls"
        let query: PullRequestListRequest = .init(author: "ReactiveX", repositoryName: "RxSwift")
        let endpoint = Endpoint.repositoryDetails.formatQueryEndpoint(params: query)
        XCTAssertEqual(endpoint, correctEndpoint)
    }
}
