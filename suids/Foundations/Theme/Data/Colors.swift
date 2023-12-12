//
//  Colors.swift
//  suids
//
//  Created by samuelematias on 12/12/23.
//

import SwiftUI

struct BaseColor {
    let contrastPrimary = Color("contrastPrimary")
    let contrastSecondary = Color("contrastSecondary")
    let themePrimary = Color("themePrimary")
    let themeSecondary = Color("themeSecondary")
    let brandPrimary = Color("brandPrimary")
    
    let darkPrimary = Color("darkPrimary")
    let lightPrimary = Color("lightPrimary")
    let gray = Color("gray")
}

struct TokenColor {
    let baseColor = BaseColor()
    
    let highlight: Color!
    let inactive: Color!
    
    let textDefault: Color!
    let textTheme: Color!
    let textNote: Color!
    let textHighlight: Color!
    let textLight: Color!
    
    let buttonTheme: Color!
    let buttonContrast: Color!
    let buttonHighlight: Color!
    
    let backgroundDefault: Color!
    let backgroundTheme: Color!
    
    init() {
        self.textTheme = baseColor.contrastPrimary
        self.buttonTheme = baseColor.themePrimary
        self.backgroundTheme = baseColor.themePrimary
        
        self.textNote = baseColor.themeSecondary
        
        self.buttonContrast = baseColor.contrastPrimary
        self.textDefault = baseColor.contrastPrimary
        self.backgroundDefault = baseColor.contrastPrimary
        
        self.highlight = baseColor.brandPrimary
        self.buttonHighlight = baseColor.brandPrimary
        self.textHighlight = baseColor.brandPrimary
        
        self.textLight = baseColor.lightPrimary
        
        self.inactive = baseColor.gray
    }
}

extension Color {
    static let Token = TokenColor()
}
