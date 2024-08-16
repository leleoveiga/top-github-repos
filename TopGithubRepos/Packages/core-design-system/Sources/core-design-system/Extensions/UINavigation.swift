//
//  UINavigation.swift
//  core-design-system
//
//  Created by Leonardo Veiga on 15/08/24.
//

import Foundation
import UIKit

public struct M2YUINavigationBarStyle {
    
    public static var defaultStyle = M2YUINavigationBarStyle(largeTitleDisplayMode: .always,
                                                             barStyle: .default,
                                                             tintColor: .black)
    
    var largeTitleDisplayMode: UINavigationItem.LargeTitleDisplayMode
    var barStyle: UIBarStyle
    var tintColor: UIColor
    var largeTitleTextAttributes: TextAttributes?
    var titleTextAttributes: TextAttributes?
    
    public struct TextAttributes {
        var foregroundColor: UIColor
        var font: UIFont
        
        public init(foregroundColor: UIColor, font: UIFont) {
            self.foregroundColor = foregroundColor
            self.font = font
        }
    }
    
    public init(largeTitleDisplayMode: UINavigationItem.LargeTitleDisplayMode, barStyle: UIBarStyle, tintColor: UIColor, largeTitleTextAttributes: TextAttributes? = nil, titleTextAttributes: TextAttributes? = nil) {
        self.largeTitleDisplayMode = largeTitleDisplayMode
        self.barStyle = barStyle
        self.tintColor = tintColor
        self.largeTitleTextAttributes = largeTitleTextAttributes
        self.titleTextAttributes = titleTextAttributes
    }
}

public extension M2YUINavigationBarStyle {
    static let mainTheme = M2YUINavigationBarStyle(
        largeTitleDisplayMode: .always,
        barStyle: StatusBar.black,
        tintColor: MainTheme.Navigation.icon,
        largeTitleTextAttributes: TextAttributes(
            foregroundColor: MainTheme.Navigation.text,
            font: .title2Bold
        ),
        titleTextAttributes: TextAttributes(
            foregroundColor: MainTheme.Navigation.text,
            font: .subheadBold
        )
    )
    
    static let mainThemeSmall = M2YUINavigationBarStyle(
        largeTitleDisplayMode: .never,
        barStyle: StatusBar.black,
        tintColor: MainTheme.Navigation.icon,
        titleTextAttributes: TextAttributes(
            foregroundColor: MainTheme.Navigation.text,
            font: .calloutBold
        )
    )
}
