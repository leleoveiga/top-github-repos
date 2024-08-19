//
//  UITableView.swift
//  core-utility
//
//  Created by Leonardo Veiga on 15/08/24.
//

import UIKit

public extension UITableView {
    
    /// Register a Nib for a given UITableViewCell type
    func registerNib<T:UITableViewCell>(from type:T.Type){
        let name = String(describing: T.self)
        register(UINib(nibName: name, bundle: nil), forCellReuseIdentifier: name)
    }
    
    /// Returns a UITableViewCell for a given Class Type
    func getCell<T:UITableViewCell>(from type:T.Type, at indexPath:IndexPath)->T{
        return self.dequeueReusableCell(withIdentifier: String(describing: T.self), for: indexPath) as! T
    }
    
    /// Reaload the UITableView animated
    func reloadDataAnimated(){
        let range    = NSMakeRange(0, self.numberOfSections)
        let sections = NSIndexSet(indexesIn: range)
        self.reloadSections(sections as IndexSet, with: .automatic)
    }
    
    func animateTableView() {
        alpha = 0.0
        UIView.animate(withDuration: 0.3, delay: 0.1, options: .curveEaseInOut, animations: {
            self.alpha = 1.0
        }, completion: nil)
    }
    
}

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
