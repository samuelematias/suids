//
//  Button.swift
//  suids
//
//  Created by samuelematias on 12/12/23.
//

import SwiftUI

private func getOpacityValue(_ isPressed: Bool) -> Double {
    let isPressedOpacity = 0.8
    return isPressed ? isPressedOpacity : 1
}


struct TokenButton {
    var buttonLabel: TokenButtonLabel
    var buttonStyle: TokenButtonStyle

    private var circleBtnType: CircleBtnType! = .primary
    private var circleBtnIcon: String! = "plus-icon"
    
    init(circleButtonType: CircleBtnType, buttonIcon: String) {
        
        var backgroundColor: TokenButtonStyle.BackgroundColor! = .theme
        var borderStyle: TokenButtonStyle.BorderStyle! = .none
        var iconSize: IconSize! = .medium
        
        switch circleButtonType {
        case .primary:
            backgroundColor = .theme
        case .support:
            backgroundColor = .clear
        }
        
        switch circleButtonType {
        case .support:
            borderStyle = .regular
        default:
            borderStyle = .none
        }
        
        switch circleButtonType {
        case .primary:
            iconSize = CircleBtnSize.medium.getIconSize()
        case .support:
            iconSize = CircleBtnSize.small.getIconSize()
        }
        
        self.circleBtnType = circleButtonType
        self.circleBtnIcon = buttonIcon
        self.buttonLabel = TokenButtonLabel(name: circleBtnIcon, iconSize: iconSize)
        self.buttonStyle = TokenButtonStyle(iconSize: iconSize, backgroundColor: backgroundColor, border: borderStyle)
    }
    
    private var iconBtnType: IconBtnType! = .action
    private var iconBtnIcon: String! = "share-icon"

    init(iconButtonType: IconBtnType = .tool, buttonIcon: String) {
        var iconSize: IconSize! = .medium
        
        switch iconButtonType {
        case .action:
            iconSize = IconBtnSize.large.getIconSize()
        case .tool:
            iconSize = IconBtnSize.medium.getIconSize()
        }
        
        self.iconBtnType = iconButtonType
        self.iconBtnIcon = buttonIcon
        self.buttonLabel = TokenButtonLabel(name: iconBtnIcon, iconSize: iconSize)
        self.buttonStyle = TokenButtonStyle(iconSize: iconSize)
    }
    
    private var capsuleBtnText: String! = "Save"
    
    init(capsuleText: String) {
        self.capsuleBtnText = capsuleText
        self.buttonLabel = TokenButtonLabel(text: capsuleText)
        self.buttonStyle = TokenButtonStyle(backgroundColor: .highlight, textColor: .light)
    }
    
    private var textBtnText: String! = "select"
    
    init(buttonText: String) {
        self.textBtnText = buttonText
        self.buttonLabel = TokenButtonLabel(text: buttonText)
        self.buttonStyle = TokenButtonStyle(textColor: .highlight)
    }
}
extension TokenButton {
    
    enum IconSize: CGFloat, Equatable {
        case extraLarge = 80
        case large = 64
        case medium = 48
        case small = 40
        case mini = 28
    }
    enum ButtonType {
        case circle, icon, capsule, text
    }
    enum StateSwitch {
        case off, on
    }
    
    enum CircleBtnType: Equatable {
        case primary, support
    }
    enum CircleBtnSize: Equatable {
        case medium, small
        
        func getIconSize() -> IconSize {
            switch self {
            case .medium:
                return IconSize.large
            case .small:
                return IconSize.medium
            }
        }
    }
    
    enum IconBtnType: Equatable {
        case tool, action
    }
    enum IconBtnSize: Equatable {
        case large, medium
        
        func getIconSize() -> IconSize {
            switch self {
            case .large:
                return IconSize.small
            case .medium:
                return IconSize.mini
            }
        }
    }
}


struct TokenButtonLabel: View {
    
    private let labelType: LabelTypes
    private var iconName: String?
    
    var isHighlighted = false
    
    private var iconSize: TokenButton.IconSize?
    
    init(name: String, iconSize: TokenButton.IconSize) {
        self.labelType = .icon
        self.iconName = name
        self.iconSize = iconSize
    }
    
    private var btnText: String?
    
    init(text: String) {
        self.labelType = .text
        self.btnText = text
    }
    
    func getView() -> some View {
        var renderView: AnyView!
        let highlightSuffix = isHighlighted ? "-highlight" : ""
        
        switch labelType {
        case .icon:
            let iconString = "\(iconName!)\(highlightSuffix)"
            
            renderView = AnyView(
                 Image("\(iconString)")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: iconSize!.rawValue, height: iconSize!.rawValue, alignment: .center)
            )
        case .text:
            renderView = AnyView(
                Text("\(btnText!)")
                    .font(Font.Typography.sizingFont(font: .main, size: .body))
            )
        }
        
        return renderView
    }
    

    var body: some View {
        getView()
    }
}

extension TokenButtonLabel {
    enum LabelTypes {
        case icon, text
    }
    enum TextColor {
        case highlight, main
        
        func getColor() -> Color {
            switch self {
            case .highlight:
                return Color.Token.textHighlight
            case .main:
                return Color.Token.textDefault
            }
        }
    }
}

extension TokenButtonLabel {
    mutating func highlight(_ highlightSwitch: TokenButton.StateSwitch) -> Self {
        self.isHighlighted = highlightSwitch == .on ? true : false
        return self
    }
}


struct TokenButtonStyle: ButtonStyle {
    
    private let styleType: StyleType
    private var iconSize: TokenButton.IconSize?
    private var backgroundColor: Color?
    private var borderStyle: Aliases.BorderStyle?
    private var textColor: Color?
    
    var isActive = true
    
    init(iconSize: TokenButton.IconSize,
         backgroundColor: BackgroundColor,
         border: BorderStyle? = .none) {
        self.styleType = .circleIcon
        self.iconSize = iconSize
        self.borderStyle = border == .none
            ? (Color.clear, 0, 0)
            : (Color.Token.buttonTheme, CGFloat(2), 12)
        self.backgroundColor = backgroundColor.getColor()
    }
    
    init(iconSize: TokenButton.IconSize) {
        self.styleType = .icon
        self.iconSize = iconSize
    }
    
    init(backgroundColor: BackgroundColor, textColor: TextColor) {
        self.styleType = .capsule
        self.backgroundColor = backgroundColor.getColor()
        self.textColor = textColor.getColor()
    }
    
    init(textColor: TextColor) {
        self.styleType = .text
        self.textColor = textColor.getColor()
    }
    
    func makeBody(configuration: Self.Configuration) -> some View {
        var renderView: AnyView!
        let verticalMargin = CapsuleValue.verticalMargin.rawValue
        let horizontalMargin = CapsuleValue.horizontalMargin.rawValue
        
        switch styleType {
        case .circleIcon:
            renderView = AnyView(configuration.label
                .background(backgroundColor!)
                .frame(width: iconSize!.rawValue, height: iconSize!.rawValue, alignment: .center)
                .clipShape(RoundedRectangle(cornerRadius: iconSize!.rawValue))
                .overlay(RoundedRectangle(cornerRadius: iconSize!.rawValue)
                    .stroke(borderStyle!.color, lineWidth: borderStyle!.width))
            )
        case .icon:
            renderView = AnyView(configuration.label
                .frame(width: iconSize!.rawValue, height: iconSize!.rawValue, alignment: .center)
                .aspectRatio(contentMode: .fill)
            )
        case .capsule:
            renderView = AnyView(configuration.label
                .padding(.init(top: verticalMargin, leading: horizontalMargin, bottom: verticalMargin, trailing: horizontalMargin))
                .foregroundColor(textColor!)
                .background(backgroundColor!)
                .cornerRadius(horizontalMargin)
            )
        case .text:
            renderView = AnyView(configuration.label
                .padding(.init(top: verticalMargin, leading: horizontalMargin, bottom: verticalMargin, trailing: horizontalMargin))
                .foregroundColor(textColor!)
            )
        }
        
        return renderView.opacity(getOpacityValue(configuration.isPressed || !isActive))
    }
}

extension TokenButtonStyle {
    enum StyleType {
        case circleIcon, icon, capsule, text
    }
    enum MaskShape {
        case circle, capsule
    }
    enum BorderStyle {
        case regular
    }
    enum TextColor {
        case highlight, light, theme
        
        func getColor() -> Color {
            switch self {
            case .highlight:
                return Color.Token.textHighlight
            case .light:
                return Color.Token.textLight
            case .theme:
                return Color.Token.textTheme
            }
        }
    }
    enum BackgroundColor {
        case theme, contrast, clear, highlight
        
        func getColor() -> Color {
            switch self {
            case .theme:
                return Color.Token.buttonTheme
            case .contrast:
                return Color.Token.buttonContrast
            case .clear:
                return Color.clear
            case .highlight:
                return Color.Token.buttonHighlight
            }
        }
    }
    enum CapsuleValue: CGFloat {
        case height = 44
        case horizontalMargin = 32
        case verticalMargin = 16
    }
}

extension TokenButtonStyle {
    mutating func activate(_ activeSwitch: TokenButton.StateSwitch) -> Self {
        self.isActive = activeSwitch == .on ? true : false
        return self
    }
}

