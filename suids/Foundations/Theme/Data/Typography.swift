//
//  Typography.swift
//  suids
//
//  Created by samuelematias on 12/12/23.
//

import SwiftUI

struct TokenTypography {

    private enum FontSize: CGFloat {
        case
        small = 12,
        medium = 17,
        large = 28
    }
    private enum FontFamily: String {
        case
        HelveticaNeue = "HelveticaNeue",
        Georgia = "Georgia"
    }
    
    enum FontSizeToken: CGFloat {
        case
        caption,
        body,
        title
        
        func getValue() -> CGFloat {
            switch self {
            case .caption:
                return FontSize.small.rawValue
            case .body:
                return FontSize.medium.rawValue
            case .title:
                return FontSize.large.rawValue
            }
        }
    }
    enum FontFamilyToken: String {
        case
        main,
        sub
        
        func getValue() -> String {
            switch self {
            case .main:
                return FontFamily.HelveticaNeue.rawValue
            case .sub:
                return FontFamily.Georgia.rawValue
            }
        }
    }

    let mainFont: Font!
    let subFont: Font!
    
    init() {
        self.mainFont = Font.custom(FontFamilyToken.main.getValue(), size: FontSizeToken.body.getValue())
        self.subFont = Font.custom(FontFamilyToken.sub.getValue(), size: FontSizeToken.caption.getValue())
    }
}

extension TokenTypography {
    public func sizingFont(font: FontFamilyToken, size: FontSizeToken) -> Font {
        return Font.custom(font.getValue(), size: size.getValue())
    }
}

extension Font {
    static let Typography = TokenTypography()
}
