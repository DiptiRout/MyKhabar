//
//  OutlinedTextFieldUIModel.swift
//  MyKhabar
//
//  Created by Diptiranjan Rout on 27/01/25.
//

import SwiftUI

struct OutlinedTextFieldUIModel {
    
    /// Compulsory Value
    let height: CGFloat

    /// Header UI Model
    let headerText: String
    let headerTextColor: Color
    let isMandatory: Bool

    
    /// TextField UI Model
    let textFont: Font
    let textColor: Color
    let rightViewImage: String
    let leftViewImage: String
    let backgroundColor: Color
    let cornerRadius: CGFloat
    let outlineColor: Color
    let lineWidth: CGFloat

    /// Footer UI Model
    let footerText: String
    let footerTextColor: Color
    let footerViewImage: String
    
    
    init(height: CGFloat,
         headerText: String = "",
         headerTextColor: Color = AppColors.color(grayscale: .bodyText),
         isMandatory: Bool = false,
         textFont: Font = AppFonts.font(for: .text, size: .small),
         textColor: Color = AppColors.systemPrimary,
         rightViewImage: String = "",
         leftViewImage: String = "",
         backgroundColor: Color = AppColors.color(error: .light),
         cornerRadius: CGFloat = 6,
         outlineColor: Color = AppColors.color(error: .dark),
         lineWidth: CGFloat = 1,
         footerText: String = "",
         footerTextColor: Color = AppColors.color(error: .dark),
         footerViewImage: String = "") {
        
        self.height = height
        self.headerText = headerText
        self.headerTextColor = headerTextColor
        self.isMandatory = isMandatory
        self.textFont = textFont
        self.textColor = textColor
        self.rightViewImage = rightViewImage
        self.leftViewImage = leftViewImage
        self.backgroundColor = backgroundColor
        self.cornerRadius = cornerRadius
        self.outlineColor = outlineColor
        self.lineWidth = lineWidth
        self.footerText = footerText
        self.footerTextColor = footerTextColor
        self.footerViewImage = footerViewImage
    }
}
