//
//  RepositoryListTests.swift
//  repositories-list
//
//  Created by Leonardo Veiga on 20/08/24.
//

import XCTest
@testable import repositories_list
@testable import RxSwift
@testable import class core_utility.MockUtils

final class RepositoryListTests: XCTestCase {
    var viewModel: RepositoriesListViewModel!
    var disposeBag: DisposeBag!
    override func setUp() {
        disposeBag = DisposeBag()
        viewModel = RepositoriesListViewModel(repository: RepositoriesListRepository())
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
    
    func testStarsOrderingRequest() {
        let orderingExpectation = expectation(description: "Repositories ordered by stars")
        viewModel.selectedSort.accept(.stars)
        viewModel.selectedLanguage.accept(.swift)
        
        viewModel.repositories
            .skip(1)
            .subscribe(onNext: { repositories in
                for i in 0..<repositories.count-1 {
                    XCTAssertGreaterThan(repositories[i].stargazersCount, repositories[i+1].stargazersCount)
                }
                orderingExpectation.fulfill()
            })
            .disposed(by: viewModel.disposeBag)
        
        viewModel.getRepositories()
        wait(for: [orderingExpectation])
    }
    
    func testStarsOrderingRequestMock() {
        let orderingExpectation = expectation(description: "Repositories ordered by stars")
        viewModel = .init(repository: RepositoriesListRepositoryMock())
        viewModel.selectedSort.accept(.stars)
        viewModel.selectedLanguage.accept(.swift)
        
        viewModel.repositories
            .skip(1)
            .subscribe(onNext: { repositories in
                for i in 0..<repositories.count-1 {
                    XCTAssertGreaterThan(repositories[i].stargazersCount, repositories[i+1].stargazersCount)
                }
                orderingExpectation.fulfill()
            })
            .disposed(by: viewModel.disposeBag)
        
        viewModel.getRepositories()
        wait(for: [orderingExpectation])
    }
    
    func testStarsUnordered() {
        let orderingExpectation = expectation(description: "Repositories ordered by stars")
        viewModel.selectedSort.accept(.forks)
        viewModel.selectedLanguage.accept(.swift)
        
        viewModel.repositories
            .skip(1)
            .subscribe(onNext: { repositories in
                for i in 0..<repositories.count-1 {
                    XCTAssertGreaterThan(repositories[i].forks, repositories[i+1].forks)
                }
                orderingExpectation.fulfill()
            })
            .disposed(by: viewModel.disposeBag)
        
        viewModel.getRepositories()
        wait(for: [orderingExpectation])
    }

    func testFilterByLanguageSwift() {
        let filterExpectation = expectation(description: "Repositories filtered by language")
        viewModel.selectedLanguage.accept(.swift)
        viewModel.selectedSort.accept(.stars)
        viewModel.repositories
            .skip(1)
            .subscribe(onNext: { repositories in
                let isAllSameLangRepos = repositories.allSatisfy { repository in
                    return repository.language == .swift
                }
                
                XCTAssertTrue(isAllSameLangRepos)
                filterExpectation.fulfill()
            })
            .disposed(by: disposeBag)
        
        viewModel.getRepositories()
        wait(for: [filterExpectation])
    }
    
    func testFilterByLanguageKotlin() {
        let filterExpectation = expectation(description: "Repositories filtered by language")
        viewModel.selectedLanguage.accept(.kotlin)
        viewModel.selectedSort.accept(.stars)
        
        viewModel.repositories
            .skip(1)
            .subscribe(onNext: { repositories in
                let isAllSameLangRepos = repositories.allSatisfy { repository in
                    return repository.language == .kotlin
                }
                
                XCTAssertTrue(isAllSameLangRepos)
                filterExpectation.fulfill()
            })
            .disposed(by: disposeBag)
        
        viewModel.getRepositories()
        wait(for: [filterExpectation])
    }
    
    func testFilterBySearchTerm() {
        let filterExpectation = expectation(description: "Repositories filtered by search term")
        let resetFilterExpectation = expectation(description: "Reset filter to all repositories")
        viewModel.selectedLanguage.accept(.swift)
        viewModel.selectedSort.accept(.stars)
        
        let searchTerm: PublishSubject<String> = .init()
        viewModel.repositories
            .subscribe(onNext: { repositories in
                searchTerm.onNext(repositories.first?.fullName ?? "")
            })
            .disposed(by: disposeBag)
        
        searchTerm.subscribe(onNext: { term in
            self.viewModel.filterRepositories(substring: term)
            
            let validFiltering = self.viewModel.repositoriesFiltered.value.allSatisfy { repo in
                repo.fullName.lowercased().contains(term.lowercased())
            }
            XCTAssertTrue(validFiltering)
            filterExpectation.fulfill()
            
            self.viewModel.resetSearch()
            XCTAssertEqual(self.viewModel.repositories.value.count, self.viewModel.repositoriesFiltered.value.count)
            resetFilterExpectation.fulfill()
        })
        .disposed(by: disposeBag)
        
        viewModel.getRepositories()
        wait(for: [filterExpectation, resetFilterExpectation])
    }
    
    func testModelsDecodable() {
        let langJson = """
{
    "data": "Swift"
}
"""
        
        let langModel: LanguageType? = MockUtils.extractModelFrom(json: langJson, key: "data")
        XCTAssertEqual(langModel, .swift)
        
        let sortJson = """
{
    "data": "stars"
}
"""
        let sortModel: SortType? = MockUtils.extractModelFrom(json: sortJson, key: "data")
        XCTAssertEqual(sortModel, .stars)
        
        
    }
}

