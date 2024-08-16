//
//  File.swift
//  app-coordinator
//
//  Created by Leonardo Veiga on 15/08/24.
//

import UIKit
import core_utility
import repositories_list

public final class MainCoordinator: Coordinator {
    
    let window: UIWindow
    public let presenter: UINavigationController
    public var coordinator: AnyObject?
    
    public init(window: UIWindow, presenter: UINavigationController) {
        self.window = window
        self.presenter = presenter
        self.window.rootViewController = presenter
    }
    
    public func start() {
        self.coordinator = goToRepositoriesList(presenter: presenter)
    }
}

extension MainCoordinator: FeatureCoordinatorDelegate {
    public func goToRepositoriesList(presenter: UINavigationController) -> Coordinator {
        let coordinator = RepositoriesListCoordinator(presenter: presenter)
        coordinator.start()
        return coordinator
    }
    
    public func goToPullRequestList(presenter: UINavigationController) -> Coordinator {
//        TODO: aqui
        return self
    }
}
