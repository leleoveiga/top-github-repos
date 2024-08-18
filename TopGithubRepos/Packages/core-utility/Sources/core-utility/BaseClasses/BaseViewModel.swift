//
//  BaseViewModel.swift
//  core-utility
//
//  Created by Leonardo Veiga on 16/08/24.
//

import Foundation
import RxSwift
import RxCocoa

// MARK: - Protocol
public protocol BaseViewModelType {
    var loading: PublishSubject<Bool> { get }
    var error: PublishSubject<String> { get }
}

open class BaseViewModel {
    
    // MARK: - Variables
    public let error = PublishSubject<String>()
    public let loading = BehaviorRelay<Bool>(value: false)
    public let disposeBag = DisposeBag()
    
    // MARK: - Init
    public init() {}
    
    // MARK: - Functions
    public func observeAPIRequest<T>(
        from request: Single<T>,
        onSuccess: @escaping (T) -> () = { _ in },
        onError: ((Error) -> ())? = nil
    ) {
        self.loading.accept(true)
        request.subscribe(onSuccess: { [weak self] response in
            guard let self = self else { return }
            self.loading.accept(false)
            onSuccess(response)
        }, onFailure: { [weak self] error in
            guard let self = self else { return }
            self.loading.accept(false)
            if let errorAction = onError {
                errorAction(error)
            } else {
                self.error.onNext(error.localizedDescription)
            }
        })
        .disposed(by: disposeBag)
    }
}

