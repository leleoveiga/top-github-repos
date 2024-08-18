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
    lazy var stackView: UIStackView = .stackView(alignment: .center)
    lazy var label: UILabel = .label(text: "Hello World", font: .largeTitleBold)
    
    override func addViews() {
        addSubview(stackView)
        stackView.addArrangedSubview(label)
    }
    
    override func addConstraints() {
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
