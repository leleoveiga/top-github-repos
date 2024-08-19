//
//  RepositoriesListViewController.swift
//  TopGithubRepos
//
//  Created by Leonardo Veiga on 15/08/24.
//

import UIKit
import RxSwift
import RxCocoa
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
    var biggestIndexPath = 0
    
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
        title = "Populares 🌟"
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
        viewModel.getRepositories()
    }
    
    override func setupObservables() {
        super.setupObservables()
        setupTableView()
        
        viewModel.selectedLanguage
            .subscribe(onNext: { [weak self] lang in
                guard let self = self else { return }
                screenView.setLanguage(lang)
            })
            .disposed(by: disposeBag)
        
        viewModel.repositories
            .map( { $0.count == 0 } )
            .subscribe(onNext: { [weak self] loading in
                guard let self = self else { return }
                screenView.setLoading(loading)
            })
            .disposed(by: disposeBag)
        
        viewModel.error
            .subscribe(
                onNext: { [weak self] error in
                    guard let self = self else { return }
                    showAlert(
                        message: "Houve um erro ao carregar os repositórios.\nTentar novamente?",
                        completion: { self.viewModel.getRepositories() })
                })
            .disposed(by: disposeBag)
        
        viewModel.loading
            .asObservable()
            .subscribe(onNext: { isLoading in
                self.tableView.setLoading(isLoading)
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
        delegate?.goToPullRequestList(repository: item)
    }
    
    func additionalSetup(cell: Cell, indexPath: Int) {
        animateCell(indexPath, cell)
        
        requestIfNeeded(indexPath)
    }
    
    private func animateCell(_ indexPath: Int, _ cell: RepositoriesListViewController.Cell) {
        if indexPath > biggestIndexPath {
            biggestIndexPath = indexPath
            cell.alpha = 0.15
            
            UIView.animate(
                withDuration: 0.35,
                animations: {
                    cell.alpha = 1
                })
        }
    }
    
    private func requestIfNeeded(_ indexPath: Int) {
        let requestOffset = 10
        if viewModel.repositories.value.count - (indexPath + requestOffset) <= 0 && !viewModel.loading.value{
            viewModel.getRepositories()
        }
    }
}

extension RepositoriesListViewController: UITableViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        animateNavSearchBar(scrollView, viewToUpdate: screenView)
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
