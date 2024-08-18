//
//  ViewControllerRxSwiftTableView.swift
//  core-utility
//
//  Created by Leonardo Veiga on 15/08/24.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

// MARK: - Cell Protocol
public protocol TableViewCell {
    associatedtype CellItem
    
    static var identifier: String { get }
    
    func setupCell(with item: CellItem)
}


// MARK: - ViewController UITableView RxSwift Protocol
public protocol ViewControllerRxSwiftTableView {
    associatedtype Cell: UITableViewCell, TableViewCell
    
    var tableView: UITableView { get }
    var tableViewItems: Observable<[Cell.CellItem]> { get }
    
    var disposeBag: DisposeBag { get }
    
    func setupTableView()
    func selected(item: Cell.CellItem)
    func additionalSetup(cell: Cell, indexPath: IndexPath)
    func lastIndexPath(indexPath: Int)
}

// MARK: - Default Implementations
public extension ViewControllerRxSwiftTableView where Self: UIViewController {
    
    func setupTableView() {
        tableView.register(Cell.self, forCellReuseIdentifier: Cell.identifier)
        
        tableViewItems
            .bind(to: tableView.rx.items(cellIdentifier: Cell.identifier,
                                         cellType: Cell.self))
        { [weak self] indexPath, item, cell in
            guard let self = self else { return }

            cell.setupCell(with: item)
            self.lastIndexPath(indexPath: indexPath)
        }
        .disposed(by: disposeBag)
        
        tableView.rx.willDisplayCell
            .subscribe(onNext: { [weak self] cell, indexPath in
                guard let self = self, let cell = cell as? Self.Cell else { return }
                self.additionalSetup(cell: cell, indexPath: indexPath)
            })
            .disposed(by: disposeBag)
        
        tableView.rx
            .modelSelected(Cell.CellItem.self)
            .subscribe(onNext: { [weak self] item in
                guard let self = self else { return }
                self.selected(item: item)
            })
            .disposed(by: disposeBag)
    }
}

public extension ViewControllerRxSwiftTableView where Self: UIViewController {
    func selected(item: Cell.CellItem) {}
    func lastIndexPath(indexPath: Int) {}
    func additionalSetup(cell: Cell, indexPath: IndexPath) {}
}

public extension ViewControllerRxSwiftTableView where Self: UITableViewDelegate {
    func setupTableViewDelegate() {
        tableView.rx.setDelegate(self).disposed(by: disposeBag)
    }
}

