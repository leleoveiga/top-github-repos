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
    public static var text: UIColor = .appGray
    // Background
    public static var background: UIColor = .appWhite
    
    // Card Design
    public struct CardDesign {
        // Background
        public static var background: UIColor = .appWhite
        // Conteúdo
        public static var content: UIColor = .primary
    }
    
    // Comunicação
    public struct Communication {
        // Informativo
        public static var info: UIColor = .primary
        // Negativo
        public static var negative: UIColor = .appRed
        // Positivo
        public static var positive: UIColor = .appGreen
        // Alerta
        public static var alert: UIColor = .appOrange
    }
    
    // Elementos Gráficos
    public struct GraphicElements {
        // Conteúdo
        public static var content: UIColor = .appWhite
        // Linha
        public static var line: UIColor = .appLightGray
        // Texto
        public static var text: UIColor = .appGray
        // Inativo
        public static var inactive: UIColor = .appMediumGray
        // Ícone
        public static var icons: UIColor = .secondary
        // Background
        public static var background: UIColor = .appWhite
    }
    
    // Navigation
    public struct Navigation {
        // Texto
        public static var text: UIColor = .appGray
        // Ícone
        public static var icon: UIColor = .secondary
    }
    
    // Textfield
    public struct TextField {
        // Texto
        public static var text: UIColor = .appGray
        // Linha
        public static var line: UIColor = .appLightGray
        // Negativo
        public static var negative: UIColor = .appRed
        // Ícone
        public static var icon: UIColor = .secondary
        // Inativo
        public static var inactive: UIColor = .appMediumGray
    }
}

// Home Indicador
public struct HomeIndicator {
    // Branco
    public static var white: UIColor = .appWhite
    // Preto
    public static var black: UIColor = .black
}

// Status Bar
public struct StatusBar {
    // Preto - Main Theme
    public static var black: UIBarStyle = .default
    // Branco - Auxiliary Theme
    public static var white: UIBarStyle = .black
}
