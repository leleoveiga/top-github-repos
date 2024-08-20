//
//  RepositoriesListCoordinator.swift
//  repositories-list
//
//  Created by Leonardo Veiga on 15/08/24.
//

import Foundation
import core_utility
import UIKit

protocol RepositoriesListCoordinatorDelegate: AnyObject {
    func goToRepositotyList()
    func goToPullRequestList(repository: Repository)
}

public class RepositoriesListCoordinator: Coordinator {
    public var presenter: UINavigationController

    private var repositoryListViewController: RepositoriesListViewController?
    private var pullRequestListViewController: PullRequestListViewController?
    
    public init(presenter: UINavigationController) {
        self.presenter = presenter
    }
    
    public func start() {
        goToRepositotyList()
    }
}

extension RepositoriesListCoordinator: RepositoriesListCoordinatorDelegate {
    func goToRepositotyList() {
        let viewModel = RepositoriesListViewModel(repository: RepositoriesListRepository())
        let viewController = RepositoriesListViewController(
            delegate: self,
            viewModel: viewModel
        )
        presenter.pushViewController(viewController, animated: true)
        repositoryListViewController = viewController
    }
    
    func goToPullRequestList(repository: Repository) {
        
        let viewModel = PullRequestListViewModel(repository: PullRequestListRepository(),
                                                 gitRepository: repository)
        let viewController = PullRequestListViewController(delegate: self,
                                                           viewModel: viewModel)
        
        presenter.pushViewController(viewController, animated: true)
        pullRequestListViewController = viewController
    }
}
