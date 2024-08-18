//
//  RepositoriesListViewController.swift
//  TopGithubRepos
//
//  Created by Leonardo Veiga on 15/08/24.
//

import UIKit
import RxSwift
import core_utility
import core_design_system

class RepositoriesListViewController: BaseViewController<RepositoriesListView> {
    private weak var delegate: RepositoriesListCoordinatorDelegate?
    let viewModel: RepositoriesListViewModel!
    let searchController: UISearchController = {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.placeholder = "Procurar..."
        searchController.searchBar.sizeToFit()
        searchController.searchBar.tintColor = MainTheme.text
        return searchController
    }()
    
    init(delegate: RepositoriesListCoordinatorDelegate, viewModel: RepositoriesListViewModel) {
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
        title = "Populares"
        setLLabsBarStyle(.mainTheme)
        setupTableView()
        
        setupTableViewDelegate()
        searchController.searchBar.delegate = self
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getRepositories()
    }
    
    override func setupObservables() {
        super.setupObservables()
        
        viewModel.selectedLanguage
            .subscribe(onNext: { [weak self] lang in
                guard let self = self else { return }
                screenView.setLanguage(lang)
            })
            .disposed(by: disposeBag)
    }
}

extension RepositoriesListViewController: ViewControllerRxSwiftTableView {

    typealias Cell = RepositoriesListViewCell

    var tableView: UITableView {
        screenView.tableView
    }

    var tableViewItems: Observable<[Repository]> {
        viewModel.repositoriesFiltered.asObservable()
    }
    
    func selected(item: Repository) {
        print("selecionou: \(item.name)")
    }
}

extension RepositoriesListViewController: UITableViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard let navigationController else { return }
        
        let offset = scrollView.contentOffset.y
        let threshold: CGFloat = 50
        
        let prefersLargeTitle = offset < threshold
        
        if navigationController.navigationBar.prefersLargeTitles != prefersLargeTitle {
            navigationController.navigationBar.prefersLargeTitles = prefersLargeTitle
            
            UIView.transition(with: navigationController.navigationBar,
                              duration: 0.15,
                              options: .curveEaseInOut,
                              animations: {
                navigationController.navigationBar.layoutIfNeeded()
                self.screenView.layoutIfNeeded()
            }, completion: nil)
        }
    }
}

extension RepositoriesListViewController: UISearchResultsUpdating, UISearchBarDelegate {
    func updateSearchResults(for searchController: UISearchController) {
        if let filterText = searchController.searchBar.text {
            if filterText.isEmpty {
                viewModel.resetSearch()
            } else {
                viewModel.filterRepositories(substring: filterText)
            }
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        viewModel.resetSearch()
    }
}
