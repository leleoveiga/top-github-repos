//
//  PullRequestListViewCell.swift
//  repositories-list
//
//  Created by Leonardo Veiga on 18/08/24.
//

import Foundation
import core_design_system
import core_utility
import UIKit

class PullRequestListViewCell: UITableViewCell {
    static var identifier: String = "PullRequestListViewCell"
    
    lazy var wrapper: UIView = .simpleView(cornerRadius: .roundedCorner(.large),
                                           borderWidth: .borderWidth(.small),
                                           borderColor: MainTheme.GraphicElements.line)
    
    lazy var stackView: UIStackView = .stackView(axis: .vertical,
                                                 alignment: .leading,
                                                 spacing: .margin(.medium))
    
    lazy var titleStackView: UIStackView = .stackView(axis: .horizontal,
                                                      spacing: .margin(.medium))
    
    lazy var repoNameLabel: UILabel = .label(font: .body1Bold,
                                             textColor: .secondary)
    
    lazy var descriptionLabel: UILabel = .label(font: .body2, numberOfLines: 3)
    
    lazy var infosStackView: UIStackView = .stackView(axis: .horizontal,
                                                      spacing: .margin(.medium))
    lazy var avatarImageView: UIImageView = .imageView()
    lazy var ownerName: UILabel = .label(font: .caption)
    lazy var forkIconImageView: UIImageView = .imageView(with: UIImage(systemName: "calendar"),
                                                         tintColor: MainTheme.GraphicElements.icons)
    lazy var dateLabel: UILabel = .label(font: .caption)
    
    
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
        titleStackView.addArrangedSubview(repoNameLabel)
        
        stackView.addArrangedSubview(descriptionLabel)
        
        stackView.addArrangedSubview(infosStackView)
        infosStackView.addArrangedSubview(avatarImageView)
        infosStackView.addArrangedSubview(ownerName)
        infosStackView.addArrangedSubview(forkIconImageView)
        infosStackView.addArrangedSubview(dateLabel)
    }
    
    func addConstraints() {
        wrapper.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.bottom.equalToSuperview().inset(.margin(.small))
        }
        
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(.margin(.medium))
        }
        
        avatarImageView.snp.makeConstraints { make in
            make.size.equalTo(CGFloat.height(.smallIcon))
        }
        
        forkIconImageView.snp.makeConstraints { make in
            make.size.equalTo(CGFloat.height(.smallIcon))
        }
    }
}

extension PullRequestListViewCell: TableViewCell {
    func setupCell(with item: PullRequestItem) {
        avatarImageView.setImage(imageUrl: item.user.avatarUrl)
        avatarImageView.clipsToBounds = true
        avatarImageView.layer.cornerRadius = .roundedCorner(.medium)

        repoNameLabel.text = item.title
        descriptionLabel.text = item.body
        ownerName.text = item.user.name
        dateLabel.text = item.date?.formatTo(.ddMMyyyy)
        
        infosStackView
            .setCustomSpacing(.margin(.xsmall), after: avatarImageView)
        infosStackView
            .setCustomSpacing(.margin(.xsmall), after: forkIconImageView)
    }
}
