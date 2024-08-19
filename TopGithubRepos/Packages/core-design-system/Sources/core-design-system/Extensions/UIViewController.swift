//
//  File.swift
//  core-design-system
//
//  Created by Leonardo Veiga on 18/08/24.
//

import Foundation
import UIKit
import SafariServices

public extension UIViewController {
    func openWebView(url: URL,
                     errorMessage: String? = nil,
                     navbarColor: UIColor = MainTheme.background,
                     navbarTintColor: UIColor = MainTheme.Navigation.icon) {
        let config = SFSafariViewController.Configuration()
        config.entersReaderIfAvailable = false
        let safariPreview = SFSafariViewController(url: url, configuration: config)
        safariPreview.dismissButtonStyle = .close
        safariPreview.preferredBarTintColor = navbarColor
        safariPreview.preferredControlTintColor = navbarTintColor
        safariPreview.modalPresentationStyle = .pageSheet
        safariPreview.modalTransitionStyle = .coverVertical
        present(safariPreview, animated: true)
    }
}
