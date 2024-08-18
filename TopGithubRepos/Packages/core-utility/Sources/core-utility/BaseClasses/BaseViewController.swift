//
//  BaseViewController.swift
//  core-utility
//
//  Created by Leonardo Veiga on 15/08/24.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

open class BaseViewController<ViewType: UIView>: UIViewController {
    
    //MARK: - Variables
    open var screenView: ViewType { return view as! ViewType }
    open var disposeBag = DisposeBag()
    
    //MARK: - LifeCycle
    /// Loads ViewController's View based on generic type ViewType. If the View has parameters for its initialization, this function should be overridden.
    open override func loadView() {
        view = ViewType()
    }
    
    /// Sets up navigation style and BaseViewModel error and loading observables.
    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupBack()
        setupObservables()
    }
    
    /// Dispose current observables, so the ViewController will not execute binds/subscribe closures if it is not being shown.
    open override func viewDidDisappear(_ animated: Bool) {
        disposeBag = DisposeBag()
        super.viewDidDisappear(animated)
    }
    
    //MARK: - Setups
    open func setupObservables() {}
    
    open func showAlert(
        title: String = "Ops!",
        message: String,
        okButtonText: String = "Ok",
        completion: (() -> Void)? = nil
    ) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: okButtonText,
                                     style: .default) { _ in
            completion?()
        }
        
        alertController.addAction(okAction)
        
        present(alertController, animated: true, completion: nil)
    }
}
