//
//  SimpleTextView.swift
//  core-design-system
//
//  Created by Leonardo Veiga on 18/08/24.
//

import Foundation
import UIKit

public final class SimpleTextView: UIView {
    
    
    private lazy var stackView: UIStackView = .stackView(axis: .vertical,
                                                    alignment: .center,
                                                    spacing: .margin(.medium))
    
    public lazy var titleLabel: UILabel = .label(text: "Buscando...",
                                                 font: .title2Bold,
                                                 numberOfLines: 0,
                                                 textAlignment: .center)
    
    private lazy var loadingIndicator: UIActivityIndicatorView = {
        let loadingIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
        loadingIndicator.color = .black
        loadingIndicator.startAnimating()
        loadingIndicator.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        return loadingIndicator
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupSubviews()
        self.setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubviews() {
        self.backgroundColor = .black
        
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(loadingIndicator)
        addSubview(stackView)
    }
    
    private func setupConstraints() {
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(.margin(.large))
        }
    }
}

