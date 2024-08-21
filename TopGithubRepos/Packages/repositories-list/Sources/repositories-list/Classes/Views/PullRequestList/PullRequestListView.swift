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

class PullRequestListView: LLView {
    lazy var wrapper: UIView = .simpleView()
    lazy var subtitle: UILabel = .label(text: "prs_list_subtitle".localize, font: .subtitleBold)
    lazy var loadingView: SimpleTextView = SimpleTextView()
    lazy var tableView: UITableView = .tableView()
    
    override func addViews() {
        addSubview(loadingView)
        addSubview(wrapper)
        wrapper.addSubview(subtitle)
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
        
        subtitle.snp.makeConstraints { make in
            make.leading.top.trailing.equalToSuperview()
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(subtitle.snp.bottom).inset(-.margin(.medium))
            make.leading.bottom.trailing.equalToSuperview()
        }
    }
    
    override func setup() {
        wrapper.isHidden = true
        loadingView.titleLabel.text = "searching_prs".localize
    }
    
    func setupView(isEmpty: Bool) {
        if isEmpty {
            loadingView.titleLabel.text = "no_pr_found".localize
        }
        loadingView.isHidden = !isEmpty
        wrapper.isHidden = isEmpty
    }
}
