//
//  RepositoriesListView.swift
//  repositories-list
//
//  Created by Leonardo Veiga on 15/08/24.
//

import Foundation

import UIKit
import SnapKit
import core_design_system

class RepositoriesListView: LLView {
    lazy var wrapper: UIView = .simpleView()
    lazy var simpleTextView: SimpleTextView = SimpleTextView()
    lazy var subtitle: UILabel = .label(font: .subtitleBold, numberOfLines: 0)
    lazy var tableView: UITableView = .tableView(hasFooterLoading: true)
    
    override func addViews() {
        addSubview(simpleTextView)
        addSubview(wrapper)
        wrapper.addSubview(subtitle)
        wrapper.addSubview(tableView)
    }
    
    override func addConstraints() {
        simpleTextView.snp.makeConstraints { make in
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
    
    func setupViewWith(_ language: LanguageType) {
        self.simpleTextView.titleLabel.text = String(format: "searching_repos".localize, arguments: [language.rawValue.capitalized])
        self.subtitle.text = String(format: "repository_list_subtitle".localize, arguments: [language.rawValue.capitalized])
    }
    
    func setLoading(_ loading: Bool) {
        simpleTextView.isHidden = !loading
        wrapper.isHidden = loading
    }
}
