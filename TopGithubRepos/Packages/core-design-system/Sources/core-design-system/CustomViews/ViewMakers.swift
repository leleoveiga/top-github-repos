//
//  ViewMakers.swift
//  core-design-system
//
//  Created by Leonardo Veiga on 18/08/24.
//

import Foundation
import UIKit

// MARK: - UITableView
public extension UITableView {
    
    static func tableView(
        separatorStyle: UITableViewCell.SeparatorStyle = .none,
        showsVerticalScrollIndicator: Bool = false,
        backgroundColor: UIColor = .clear,
        bounces: Bool = true,
        allowsSelection: Bool = true,
        hasFooterLoading: Bool = false
    ) -> UITableView {
        let tableView = UITableView()
        tableView.contentInset = UIEdgeInsets.zero
        tableView.separatorStyle = separatorStyle
        tableView.showsVerticalScrollIndicator = showsVerticalScrollIndicator
        tableView.backgroundColor = backgroundColor
        tableView.bounces = bounces
        tableView.allowsSelection = allowsSelection
        if hasFooterLoading {
            tableView.addFooterLoading()
        }
        return tableView
    }
    
    func addFooterLoading() {
        let loadingIndicator = UIActivityIndicatorView(style: .large)
        loadingIndicator.color = .gray
        loadingIndicator.hidesWhenStopped = true
        self.tableFooterView = loadingIndicator
    }
    
    func setLoading(_ isLoading: Bool) {
        if isLoading {
            (self.tableFooterView as? UIActivityIndicatorView)?.startAnimating()
        } else {
            (self.tableFooterView as? UIActivityIndicatorView)?.stopAnimating()
        }
    }
}

// MARK: - UIView
public extension UIView {
    
    static func simpleView(color: UIColor = .clear,
                           cornerRadius: CGFloat = 0,
                           borderWidth: CGFloat = 1,
                           borderColor: UIColor = .clear) -> UIView {
        let view = UIView()
        view.layer.cornerRadius = cornerRadius
        view.backgroundColor = color
        view.layer.borderWidth = borderWidth
        view.layer.borderColor = borderColor.cgColor
        return view
    }
}

// MARK: - UILabel
public extension UILabel {
    
    static func label(
        text: String? = nil,
        font: UIFont = .body1,
        numberOfLines: Int = 1,
        textColor: UIColor = MainTheme.text,
        textAlignment: NSTextAlignment = .natural
    ) -> UILabel {
        let label = UILabel()
        
        if let text = text {
            label.text = text
        }
        
        label.numberOfLines = numberOfLines
        label.font = font
        label.textAlignment = textAlignment
        label.textColor = textColor
        
        return label
    }
}

// MARK: - UIStackView
public extension UIStackView {
    
    static func stackView(
        axis: NSLayoutConstraint.Axis = .vertical,
        distribution: Distribution = .fill,
        alignment: Alignment = .fill,
        spacing: CGFloat = .margin(.small)
    ) -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = axis
        stackView.alignment = alignment
        stackView.distribution = distribution
        stackView.spacing = spacing
        return stackView
    }
}


// MARK: - UIImage
public extension UIImage {
    
    static func image(
        with name: String,
        in bundle: Bundle? = nil,
        renderingMode: RenderingMode = .alwaysOriginal
    ) -> UIImage {
        return UIImage(named: name, in: bundle, compatibleWith: nil)?.withRenderingMode(renderingMode) ?? UIImage()
    }
}

// MARK: - UIImageView
public extension UIImageView {
    
    static func imageView(
        with name: String = "",
        in bundle: Bundle? = nil,
        tintColor: UIColor? = nil,
        contentMode: ContentMode = .scaleToFill
    ) -> UIImageView {
        let imageView = UIImageView()
        let image: UIImage = .image(with: name,
                                    in: bundle,
                                    renderingMode: tintColor == nil ? .alwaysOriginal : .alwaysTemplate)
        imageView.image = image
        if let tintColor = tintColor {
            imageView.tintColor = tintColor
        }
        imageView.contentMode = contentMode
        return imageView
    }
    
    static func imageView(
        with image: UIImage?,
        tintColor: UIColor? = nil,
        contentMode: ContentMode = .scaleToFill
    ) -> UIImageView {
        let imageView = UIImageView()
        imageView.image = image?.withRenderingMode(tintColor == nil ? .alwaysOriginal : .alwaysTemplate) ?? UIImage()
        if let tintColor = tintColor {
            imageView.tintColor = tintColor
        }
        imageView.contentMode = contentMode
        return imageView
    }
}

protocol LLViewProtocol {
    func addViews()
    func addConstraints()
    func setup()
}

open class LLView: UIView, LLViewProtocol {
    private lazy var loadingView: SimpleTextView? = nil
    
    open func addViews() {}
    open func addConstraints() {}
    open func setup() {}
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = MainTheme.background
        addViews()
        addConstraints()
        setup()
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

