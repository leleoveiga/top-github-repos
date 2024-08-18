//
//  Colors.swift
//  core-design-system
//
//  Created by Leonardo Veiga on 15/08/24.
//

import Foundation
import UIKit

public struct MainTheme {
    // Texto
    public static var text: UIColor = .appLightGray
    // Background
    public static var background: UIColor = .black
    
    // Elementos Gráficos
    public struct GraphicElements {
        // Linha
        public static var line: UIColor = .appGray
        // Ícone
        public static var icons: UIColor = .appMediumGray
        // Background
        public static var background: UIColor = .appGray
    }
    
    // Navigation
    public struct Navigation {
        // Texto
        public static var text: UIColor = .appLightGray
        // Ícone
        public static var icon: UIColor = .secondary
    }
}

// Status Bar
public struct StatusBar {
    // Preto - Main Theme
    public static var black: UIBarStyle = .default
    // Branco - Auxiliary Theme
    public static var white: UIBarStyle = .black
}
