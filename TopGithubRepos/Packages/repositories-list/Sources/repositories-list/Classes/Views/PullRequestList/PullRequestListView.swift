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
import WebKit

class PullRequestListView: LLView {
    lazy var wrapper: UIView = .simpleView()
    lazy var loadingView: SimpleTextView = SimpleTextView()
    lazy var tableView: UITableView = .tableView()
    lazy var webView: WKWebView = WKWebView()
    
    override func addViews() {
        addSubview(loadingView)
        addSubview(webView)
        addSubview(wrapper)
        wrapper.addSubview(tableView)
    }
    
    override func addConstraints() {
        loadingView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        webView.snp.makeConstraints { make in
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
        webView.isHidden = true
        print("FUNCIONOU webView.isHidden = true")
    }
    
    func setLanguage(_ language: LanguageType) {
        self.loadingView.titleLabel.text = "Buscando PRs..."
    }
    
    func setLoading(_ loading: Bool) {
        loadingView.isHidden = !loading
        wrapper.isHidden = loading
    }
    
    func openWebView(_ url: URL) {
        webView.load(URLRequest(url: url))
        webView.isHidden = false
    }
}
