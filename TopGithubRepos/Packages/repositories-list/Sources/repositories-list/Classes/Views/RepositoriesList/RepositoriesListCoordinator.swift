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
}

public class RepositoriesListCoordinator: Coordinator {
    public var presenter: UINavigationController

    private var repositoryListViewController: RepositoriesListViewController!
    
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
        self.repositoryListViewController = viewController
    }
}
