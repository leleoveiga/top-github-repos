//
//  Coordinator.swift
//  core-utility
//
//  Created by Leonardo Veiga on 15/08/24.
//

import UIKit

public protocol Coordinator: AnyObject {
    
    // MARK: - Variables
    var presenter: UINavigationController { get }
    
    // MARK: - Functions
    func start()
}
