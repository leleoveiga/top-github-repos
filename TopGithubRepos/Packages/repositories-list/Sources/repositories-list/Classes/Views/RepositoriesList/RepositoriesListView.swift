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
    lazy var loadingView: LoadingView = LoadingView()
    lazy var subtitle: UILabel = .label(font: .subtitleBold, numberOfLines: 0)
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
    
    func setLanguage(_ language: LanguageType) {
        self.loadingView.titleLabel.text = "Buscando repositórios utilizando a linguagem \(language.rawValue.capitalized)..."
        self.subtitle.text = "Repositórios mais populares usando a linguagem de programaçao \(language.rawValue.capitalized) no Github:"
    }
    
    func setLoading(_ loading: Bool) {
        loadingView.isHidden = !loading
        wrapper.isHidden = loading
    }
}
