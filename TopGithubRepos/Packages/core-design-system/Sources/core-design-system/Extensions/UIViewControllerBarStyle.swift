//
//  UIViewController.swift
//  core-design-system
//
//  Created by Leonardo Veiga on 15/08/24.
//

import Foundation
import UIKit

public extension UIViewController {
    func setM2YBarStyle(_ style: M2YUINavigationBarStyle) {
        guard let navigationBar = navigationController?.navigationBar else { return }
        navigationItem.largeTitleDisplayMode = style.largeTitleDisplayMode
        navigationBar.barStyle = style.barStyle
        navigationBar.tintColor = style.tintColor
        
        if let largeTitleTextAttributes = style.largeTitleTextAttributes {
            navigationBar.largeTitleTextAttributes = [
                .foregroundColor: largeTitleTextAttributes.foregroundColor,
                .font: largeTitleTextAttributes.font
            ]
        }
        
        if let titleTextAttributes = style.titleTextAttributes {
            navigationBar.titleTextAttributes = [
                .foregroundColor: titleTextAttributes.foregroundColor,
                .font: titleTextAttributes.font
            ]
        }
    }
}
