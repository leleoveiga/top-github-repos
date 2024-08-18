//
//  UIColor.swift
//  core-design-system
//
//  Created by Leonardo Veiga on 15/08/24.
//

import UIKit
import Foundation

public extension UIColor {
    static var primary = appColor("primary")
    static var secondary = appColor("secondary")
    static var appWhite = appColor("appWhite")
    static var appLightGray = appColor("appLightGray")
    static var appMediumGray = appColor("appMediumGray")
    static var appGray = appColor("appGray")
    static var appRed = appColor("appRed")
    static var appOrange = appColor("appOrange")
    static var appGreen = appColor("appGreen")
    
    /// Returns a given AssetsColor
    private static func appColor(_ name: String) -> UIColor {
        return UIColor(named: name, in: .main, compatibleWith: nil) ?? .red
    }
}
