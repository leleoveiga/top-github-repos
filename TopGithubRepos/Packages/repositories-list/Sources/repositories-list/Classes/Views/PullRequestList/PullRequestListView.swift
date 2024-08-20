//
//  PullRequestListView.swift
//  repositories-list
//
//  Created by Leonardo Veiga on 15/08/24.
//

import Foundation
import UIKit
import SnapKit
import core_design_system
import Hero

class PullRequestListView: LLView {
    lazy var wrapper: UIView = .simpleView()
    lazy var loadingView: SimpleTextView = SimpleTextView()
    lazy var tableView: UITableView = .tableView()
    
    override func addViews() {
        addSubview(loadingView)
        addSubview(wrapper)
        wrapper.addSubview(tableView)
    }
    
    override func addConstraints() {
        loadingView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        wrapper.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide)
            make.leading.trailing.equalTo(safeAreaLayoutGuide).inset(.margin(.large))
            make.bottom.equalTo(safeAreaLayoutGuide).inset(.margin(.medium))
        }
        
        tableView.snp.makeConstraints { make in
            make.top.leading.bottom.trailing.equalToSuperview()
        }
    }
    
    override func setup() {
        loadingView.titleLabel.text = "Buscando PRs abertos... 🔎"
        
    }
    
    func setLoading(_ loading: Bool) {
        loadingView.isHidden = !loading
        wrapper.isHidden = loading
    }
}
