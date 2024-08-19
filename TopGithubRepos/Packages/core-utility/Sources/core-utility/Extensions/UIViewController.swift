//
//  UIViewController.swift
//  core-utility
//
//  Created by Leonardo Veiga on 15/08/24.
//

import Foundation
import UIKit


public extension UIViewController {
    
    /// Presents a new ViewController modally with .crossDissolve animation
    func showModal(_ viewController: UIViewController, _ overFullScreen:Bool = false) {
        if overFullScreen{
            viewController.modalTransitionStyle   = .crossDissolve
            viewController.modalPresentationStyle = .overFullScreen
        }
        self.present(viewController, animated: true, completion: nil)
    }
    
    /// Blocks the user's interactions with the view
    func lockView(_ view: UIView){
        view.isUserInteractionEnabled = false
    }
    
    /// Enables the user's interactions with the view
    func unlockView(_ view: UIView) {
        view.isUserInteractionEnabled = true
    }
    
    /// Settings for large title
    func setLargeTitle(_ largeTitle: Bool){
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = largeTitle ? .always : .never
    }
    
    /**
     Retira o texto do back no navigationItem. Fica apenas a seta "<"
     */
    func setupBack() {
        let backItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationItem.backBarButtonItem = backItem
    }
    
    /// Hides back button for the current ViewController
    func hideBackButton() {
        navigationItem.setHidesBackButton(true, animated: true)
    }
}
