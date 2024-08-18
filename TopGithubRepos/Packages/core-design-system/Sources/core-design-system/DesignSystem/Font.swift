//
//  Font.swift
//  core-design-system
//
//  Created by Leonardo Veiga on 15/08/24.
//

import Foundation
import UIKit

public enum FontWeight: String {
    case regular = "fontRegular"
    case bold = "fontBold"
}

private func getFont(fontWeight: FontWeight, size: CGFloat) -> UIFont {
    var bundle = Bundle.main
    var name = fontWeight.rawValue
    var fontURL: URL?
    
    // Try to catch custom Font
    let fontTTF = bundle.url(forResource: name, withExtension: "ttf")
    let fontOTF = bundle.url(forResource: name, withExtension: "otf")
    if let fontBundleURL = fontTTF ?? fontOTF {
        fontURL = fontBundleURL
    } else {
        // Change to Default font
        switch fontWeight {
        case .regular:
            name = "Roboto-Regular"
        case .bold:
            name = "Roboto-Bold"
        }
        bundle = Bundle.main
        fontURL = bundle.url(forResource: name, withExtension: "ttf")
    }
    
    guard
        let fontURL = fontURL,
        let fontData = try? Data(contentsOf: fontURL) as CFData,
        let provider = CGDataProvider(data: fontData),
        let cgFont = CGFont(provider)
    else {
        return UIFont.systemFont(ofSize: size, weight: fontWeight == .bold ? .bold : .regular)
    }
    CTFontManagerRegisterGraphicsFont(cgFont, nil)
    return UIFont(name: String(cgFont.postScriptName ?? ""), size: size)
    ?? UIFont.systemFont(ofSize: size, weight: fontWeight == .bold ? .bold : .regular)
}

public extension UIFont {
    static let title1: UIFont = getFont(fontWeight: .regular, size: 28.0)
    static let title1Bold: UIFont = getFont(fontWeight: .bold, size: 28.0)
    static let title2: UIFont = getFont(fontWeight: .regular, size: 20.0)
    static let title2Bold: UIFont = getFont(fontWeight: .bold, size: 20.0)
    static let subtitle: UIFont = getFont(fontWeight: .regular, size: 16.0)
    static let subtitleBold: UIFont = getFont(fontWeight: .bold, size: 16.0)
    static let body1: UIFont = getFont(fontWeight: .regular, size: 15.0)
    static let body1Bold: UIFont = getFont(fontWeight: .bold, size: 15.0)
    static let body2: UIFont = getFont(fontWeight: .regular, size: 13.0)
    static let body2Bold: UIFont = getFont(fontWeight: .bold, size: 13.0)
    static let caption: UIFont = getFont(fontWeight: .regular, size: 11.0)
    static let captionBold: UIFont = getFont(fontWeight: .bold, size: 11.0)
    
    static func customSize(size: CGFloat) -> UIFont {
        getFont(fontWeight: .regular, size: size)
    }
    static func customSizeBold(size: CGFloat) -> UIFont {
        getFont(fontWeight: .bold, size: size)
    }
}
