//
//  PullRequestListViewController.swift
//  TopGithubRepos
//
//  Created by Leonardo Veiga on 15/08/24.
//

import UIKit
import RxSwift
import RxCocoa
import core_utility
import core_design_system

class PullRequestListViewController: BaseViewController<PullRequestListView> {
    private weak var delegate: RepositoriesListCoordinatorDelegate?
    let viewModel: PullRequestListViewModel!
    let searchController: UISearchController = {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.placeholder = "search".localize
        searchController.searchBar.sizeToFit()
        searchController.searchBar.tintColor = MainTheme.text
        return searchController
    }()
    var biggestIndexPath = 0
    
    init(delegate: RepositoriesListCoordinatorDelegate, viewModel: PullRequestListViewModel) {
        self.delegate = delegate
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
        title = viewModel.selectedRepository.name
        setLLabsBarStyle(.mainTheme)
        setupSearchBar()
    }
    
    private func setupSearchBar() {
        searchController.searchBar.delegate = self
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getPullRequests()
    }
    
    override func setupObservables() {
        super.setupObservables()
        setupTableView()
        
        viewModel.isPullRequestListEmpty
            .subscribe(onNext: { [weak self] empty in
                guard let self = self else { return }
                screenView.setupView(isEmpty: empty)
            })
            .disposed(by: disposeBag)
        
        viewModel.error
            .subscribe(
                onNext: { [weak self] error in
                    guard let self = self else { return }
                    showAlert(
                        message: "search_prs_error".localize,
                        completion: { self.viewModel.getPullRequests() })
                })
            .disposed(by: disposeBag)
    }
}

extension PullRequestListViewController: ViewControllerRxSwiftTableView {

    typealias Cell = PullRequestListViewCell

    var tableView: UITableView {
        screenView.tableView
    }
    
    var tableViewItems: Observable<[PullRequestItem]> {
        viewModel.pullRequestsFiltered.asObservable()
    }
    
    func selected(item: PullRequestItem) {
        if let url = URL(string: item.htmlUrl) {
            openWebView(url: url)
        } else {
            showAlert(message: "broken_url".localize)
        }
    }
}

extension PullRequestListViewController: UITableViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        animateNavSearchBar(scrollView, viewToUpdate: screenView)
    }
}

extension PullRequestListViewController: UISearchResultsUpdating, UISearchBarDelegate {
    func updateSearchResults(for searchController: UISearchController) {
        if let filterText = searchController.searchBar.text {
            if filterText.isEmpty {
                viewModel.resetSearch()
            } else {
                viewModel.filterPullRequests(substring: filterText)
            }
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        viewModel.resetSearch()
    }
}
