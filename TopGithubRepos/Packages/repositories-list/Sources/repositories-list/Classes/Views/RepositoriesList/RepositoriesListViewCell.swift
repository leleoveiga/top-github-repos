//
//  RepositoriesListViewCell.swift
//  repositories-list
//
//  Created by Leonardo Veiga on 18/08/24.
//

import Foundation
import core_design_system
import core_utility
import UIKit

class RepositoriesListViewCell: UITableViewCell {
    static var identifier: String = "RepositoriesListViewCell"
    
    lazy var wrapper: UIView = .simpleView(cornerRadius: .roundedCorner(.large),
                                           borderWidth: .borderWidth(.small),
                                           borderColor: MainTheme.GraphicElements.line)
    
    lazy var stackView: UIStackView = .stackView(axis: .vertical,
                                                 alignment: .leading,
                                                 spacing: .margin(.medium))
    
    lazy var titleStackView: UIStackView = .stackView(axis: .horizontal,
                                                      spacing: .margin(.medium))
    lazy var iconImageView: UIImageView = .imageView()
    lazy var repoNameLabel: UILabel = .label(font: .body1Bold,
                                             textColor: .secondary)
    
    lazy var descriptionLabel: UILabel = .label(font: .body2, numberOfLines: 3)
    
    lazy var infosStackView: UIStackView = .stackView(axis: .horizontal,
                                                      spacing: .margin(.medium))
    lazy var starIconImageView: UIImageView = .imageView(
        with: UIImage(systemName: "star"),
        tintColor: MainTheme.GraphicElements.icons
    )
    lazy var starsCountLabel: UILabel = .label(font: .caption)
    lazy var forkIconImageView: UIImageView = .imageView(with: "ic_fork",
                                                         in: .module,
                                                         tintColor: MainTheme.GraphicElements.icons)
    lazy var forksCountLabel: UILabel = .label(font: .caption)
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addViews()
        addConstraints()
        selectionStyle = .none
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addViews() {
        contentView.addSubview(wrapper)
        
        wrapper.addSubview(stackView)
        
        stackView.addArrangedSubview(titleStackView)
        titleStackView.addArrangedSubview(iconImageView)
        titleStackView.addArrangedSubview(repoNameLabel)
        
        stackView.addArrangedSubview(descriptionLabel)
        
        stackView.addArrangedSubview(infosStackView)
        infosStackView.addArrangedSubview(starIconImageView)
        infosStackView.addArrangedSubview(starsCountLabel)
        infosStackView.addArrangedSubview(forkIconImageView)
        infosStackView.addArrangedSubview(forksCountLabel)
    }
    
    func addConstraints() {
        wrapper.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.bottom.equalToSuperview().inset(.margin(.small))
        }
        
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(.margin(.medium))
        }
        
        iconImageView.snp.makeConstraints { make in
            make.size.equalTo(CGFloat.height(.profilePicture))
        }
        
        starIconImageView.snp.makeConstraints { make in
            make.size.equalTo(CGFloat.height(.smallIcon))
        }
        
        forkIconImageView.snp.makeConstraints { make in
            make.size.equalTo(CGFloat.height(.smallIcon))
        }
    }
    
}

extension RepositoriesListViewCell: TableViewCell {
    func setupCell(with item: Repository) {
        iconImageView.setImage(imageUrl: item.owner.avatarUrl)
        iconImageView.clipsToBounds = true
        iconImageView.layer.cornerRadius = .roundedCorner(.medium)

        repoNameLabel.text = item.fullName
        descriptionLabel.text = item.description
        starsCountLabel.text = item.stargazersCount.roundedWithAbbreviations
        forksCountLabel.text = item.forks.roundedWithAbbreviations
        
        infosStackView
            .setCustomSpacing(.margin(.xsmall), after: starIconImageView)
        infosStackView
            .setCustomSpacing(.margin(.xsmall), after: forkIconImageView)
    }
}
