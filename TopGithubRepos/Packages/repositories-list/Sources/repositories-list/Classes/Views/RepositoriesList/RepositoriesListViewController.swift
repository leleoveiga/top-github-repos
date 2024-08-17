//
//  RepositoriesListViewController.swift
//  TopGithubRepos
//
//  Created by Leonardo Veiga on 15/08/24.
//

import UIKit
import core_utility

class RepositoriesListViewController: BaseViewController<RepositoriesListView> {
    private weak var delegate: RepositoriesListCoordinatorDelegate?
    let viewModel: RepositoriesListViewModel!
    
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
        title = "Top repositórios"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getRepositories()
    }
    
    override func setupObservables() {
        super.setupObservables()
        
        viewModel.repositories
            .subscribe(onNext: { [weak self] repositories in
                guard let self = self, repositories.count > 0 else { return }
                screenView.label.text = repositories[0].name
            })
            .disposed(by: disposeBag)
    }
}

