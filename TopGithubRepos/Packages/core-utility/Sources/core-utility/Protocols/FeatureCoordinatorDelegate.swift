//
//  FeatureCoordinatorDelegate.swift
//  core-utility
//
//  Created by Leonardo Veiga on 15/08/24.
//

import Foundation
import UIKit

public protocol FeatureCoordinatorDelegate: AnyObject {
    func goToPullRequestList(presenter: UINavigationController) -> Coordinator
    func goToRepositoriesList(presenter: UINavigationController) -> Coordinator
}
