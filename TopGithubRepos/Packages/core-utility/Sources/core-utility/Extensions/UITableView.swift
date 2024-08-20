//
//  UITableView.swift
//  core-utility
//
//  Created by Leonardo Veiga on 15/08/24.
//

import UIKit

public extension UIScrollViewDelegate where Self: UIViewController {
    func animateNavSearchBar(_ scrollView: UIScrollView, viewToUpdate: UIView) {
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
                viewToUpdate.layoutIfNeeded()
            }, completion: nil)
        }
    }

}
