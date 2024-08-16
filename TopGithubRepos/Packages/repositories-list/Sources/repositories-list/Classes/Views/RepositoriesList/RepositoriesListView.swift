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

class RepositoriesListView: UIView {
    private enum Layout {
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .appGreen
        addViews()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var stackView: UIStackView = {
        let label = UIStackView()
        label.axis = .vertical
        label.spacing = 16
        label.alignment = .center
        label.distribution = .fill
        return label
    }()
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .largeTitleBold
        label.text = "Hello World"
        return label
    }()
    
    private func addViews() {
        addSubview(stackView)
        stackView.addArrangedSubview(label)
    }
    
    private func addConstraints() {
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
