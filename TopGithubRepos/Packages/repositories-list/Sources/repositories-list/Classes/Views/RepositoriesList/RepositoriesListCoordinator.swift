//
//  RepositoriesListCoordinator.swift
//  repositories-list
//
//  Created by Leonardo Veiga on 15/08/24.
//

import Foundation
import core_utility
import UIKit

public class RepositoriesListCoordinator: Coordinator {
    public var presenter: UINavigationController

    private var repositoryListViewController: RepositoriesListViewController!
    
    public init(presenter: UINavigationController) {
        self.presenter = presenter
    }
    
    public func start() {
        let viewController = RepositoriesListViewController()
        presenter.pushViewController(viewController, animated: true)
        self.repositoryListViewController = viewController
    }
}
