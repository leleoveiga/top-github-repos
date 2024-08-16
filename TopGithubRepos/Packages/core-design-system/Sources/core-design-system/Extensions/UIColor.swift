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

// MARK: - Color Style Setup
public extension UIColor {
    
    static func setupProjectColors(
        // MainTheme
        mainThemeText: UIColor = .appGray,
        mainThemeBackground: UIColor = .appWhite,
        // Main Theme - Card Design
        mainThemeCardDesignBackground: UIColor = .primary,
        mainThemeCardDesignContent: UIColor = .appWhite,
        // Main Theme - Communication
        mainThemeCommunicationInfo: UIColor = .primary,
        mainThemeCommunicationNegative: UIColor = .appRed,
        mainThemeCommunicationPositive: UIColor = .appGreen,
        mainThemeCommunicationAlert: UIColor = .appOrange,
        // Main Theme - Graphic Elements
        mainThemeGraphicElementsContent: UIColor = .appWhite,
        mainThemeGraphicElementsLine: UIColor = .appLightGray,
        mainThemeGraphicElementsText: UIColor = .appGray,
        mainThemeGraphicElementsInactive: UIColor = .appMediumGray,
        mainThemeGraphicElementsIcons: UIColor = .secondary,
        mainThemeGraphicElementsBackground: UIColor = .appWhite,
        // Main Theme - Navigation
        mainThemeNavigationText: UIColor = .appGray,
        mainThemeNavigationIcon: UIColor = .secondary,
        // Main Theme - TextField
        mainThemeTextFieldText: UIColor = .appGray,
        mainThemeTextFieldLine: UIColor = .appLightGray,
        mainThemeTextFieldNegative: UIColor = .appRed,
        mainThemeTextFieldIcon: UIColor = .secondary,
        mainThemeTextFieldInactive: UIColor = .appMediumGray,
        // AuxiliaryTheme
        auxiliaryThemeText: UIColor = .appWhite,
        auxiliaryThemeBackground: UIColor = .primary,
        // Auxiliary Theme - Graphic Elements
        auxiliaryThemeGraphicElementsIcon: UIColor = .appGreen,
        auxiliaryThemeGraphicElementsIcons: UIColor = .appWhite,
        auxiliaryThemeGraphicElementsOpacity: UIColor = .appWhite.withAlphaComponent(0.4),
        auxiliaryThemeGraphicElementsActiveIndicator: UIColor = .secondary,
        // Auxiliary Theme - Navigation
        auxiliaryThemeNavigationText: UIColor = .appWhite,
        auxiliaryThemeNavigationIcon: UIColor = .secondary,
        // TransparentTheme
        transparentThemeText: UIColor = .appWhite,
        transparentThemeBackground: UIColor = .black.withAlphaComponent(0.6),
        // Transparent Theme - Navigation
        transparentThemeNavigationText: UIColor = .appWhite,
        transparentThemeNavigationIcon: UIColor = .appWhite,
        // Transparent Theme - Graphic Elements
        transparentThemeGraphicElementsIcon: UIColor = .appWhite,
        // ContainedButton - Primary
        containedButtonPrimaryContent: UIColor = .appWhite,
        containedButtonPrimaryBackground: UIColor = .primary,
        // ContainedButton - Secondary
        containedButtonSecondaryContent: UIColor = .appGray,
        containedButtonSecondaryBackground: UIColor = .secondary,
        // ContainedButton - Tertiary
        containedButtonTertiaryContent: UIColor = .appGray,
        containedButtonTertiaryBackground: UIColor = .secondary,
        // ContainedButton - Transparent
        containedButtonTransparentContent: UIColor = .appGray,
        containedButtonTransparentBackground: UIColor = .secondary,
        // ContainedButton - Interactive
        containedButtonInactiveContent: UIColor = .appWhite,
        containedButtonInactiveBackground: UIColor = .appMediumGray,
        // OutlineButton - Primary
        outlineButtonPrimaryContent: UIColor = .appGray,
        outlineButtonPrimaryStroke: UIColor = .primary,
        // OutlineButton - Secondary
        outlineButtonSecondaryContent: UIColor = .secondary,
        outlineButtonSecondaryStroke: UIColor = .secondary,
        // OutlineButton - Tertiary
        outlineButtonTertiaryContent: UIColor = .appWhite,
        outlineButtonTertiaryStroke: UIColor = .appWhite,
        // OutlineButton - Transparent
        outlineButtonTransparentContent: UIColor = .appWhite,
        outlineButtonTransparentStroke: UIColor = .appWhite,
        // OutlineButton - Inactive
        outlineButtonInactiveContent: UIColor = .appMediumGray,
        outlineButtonInactiveStroke: UIColor = .appMediumGray,
        // Dialog
        dialogText: UIColor = .appGray,
        dialogBackground: UIColor = .appWhite,
        // Dialog - Icons
        dialogIconsContent: UIColor = .appWhite,
        dialogIconsPositive: UIColor = .appGreen,
        dialogIconsNegative: UIColor = .appRed,
        dialogIconsAlert: UIColor = .appOrange,
        dialogIconsInfo: UIColor = .primary,
        // HomeIndicator
        homeIndicatorWhite: UIColor = .appWhite,
        homeIndicatorBlack: UIColor = .black,
        // StatusBar
        statusBarBlack: UIBarStyle = .default,
        statusBarWhite: UIBarStyle = .black,
        // Navigation Bar Style
        navigationBarDefaultStyle: M2YUINavigationBarStyle = .mainTheme
    ) {
        MainTheme.text = mainThemeText
        MainTheme.background = mainThemeBackground
        
        MainTheme.CardDesign.background = mainThemeCardDesignBackground
        MainTheme.CardDesign.content = mainThemeCardDesignContent
        
        MainTheme.Communication.info = mainThemeCommunicationInfo
        MainTheme.Communication.negative = mainThemeCommunicationNegative
        MainTheme.Communication.positive = mainThemeCommunicationPositive
        MainTheme.Communication.alert = mainThemeCommunicationAlert
        
        MainTheme.GraphicElements.content = mainThemeGraphicElementsContent
        MainTheme.GraphicElements.line = mainThemeGraphicElementsLine
        MainTheme.GraphicElements.text = mainThemeGraphicElementsText
        MainTheme.GraphicElements.inactive = mainThemeGraphicElementsInactive
        MainTheme.GraphicElements.icons = mainThemeGraphicElementsIcons
        MainTheme.GraphicElements.background = mainThemeGraphicElementsBackground
        
        MainTheme.Navigation.text = mainThemeNavigationText
        MainTheme.Navigation.icon = mainThemeNavigationIcon
        
        MainTheme.TextField.text = mainThemeTextFieldText
        MainTheme.TextField.line = mainThemeTextFieldLine
        MainTheme.TextField.negative = mainThemeTextFieldNegative
        MainTheme.TextField.icon = mainThemeTextFieldIcon
        MainTheme.TextField.inactive = mainThemeTextFieldInactive
        
        HomeIndicator.white = homeIndicatorWhite
        HomeIndicator.black = homeIndicatorBlack
        
        StatusBar.black = statusBarBlack
        StatusBar.white = statusBarWhite
        
        M2YUINavigationBarStyle.defaultStyle = navigationBarDefaultStyle
    }
    
    @MainActor static func setupCustomRawColors(
        primary: UIColor = .primary,
        secondary: UIColor = .secondary,
        appWhite: UIColor = .appWhite,
        appLightGray: UIColor = .appLightGray,
        appMediumGray: UIColor = .appMediumGray,
        appGray: UIColor = .appGray,
        appRed: UIColor = .appRed,
        appOrange: UIColor = .appOrange,
        appGreen: UIColor = .appGreen
    ) {
        UIColor.primary = primary
        UIColor.secondary = secondary
        UIColor.appWhite = appWhite
        UIColor.appLightGray = appLightGray
        UIColor.appMediumGray = appMediumGray
        UIColor.appGray = appGray
        UIColor.appRed = appRed
        UIColor.appOrange = appOrange
        UIColor.appGreen = appGreen
        
        setupProjectColors()
    }
}
