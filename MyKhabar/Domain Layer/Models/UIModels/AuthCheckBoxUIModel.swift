//
//  AuthCheckBoxUIModel.swift
//  MyKhabar
//
//  Created by Diptiranjan Rout on 27/01/25.
//

import SwiftUI

struct AuthCheckBoxUIModel {
    
    let lableText: String
    let textColor: Color
    let textFont: Font
    let checkBoxFont: Font
    let checkedBoxColor: Color
    var uncheckedBoxColor: Color = AppColors.color(grayscale: .bodyText)
    
    init(lableText: String = "Remember Me",
         textColor: Color = AppColors.color(grayscale: .bodyText),
         textFont: Font = AppFonts.font(for: .text, size: .small),
         checkBoxFont: Font = AppFonts.font(for: .text, size: .large),
         checkedBoxColor: Color = AppColors.appPrimary,
         uncheckedBoxColor: Color = AppColors.color(grayscale: .bodyText)
    ) {
        self.lableText = lableText
        self.textColor = textColor
        self.textFont = textFont
        self.checkBoxFont = checkBoxFont
        self.checkedBoxColor = checkedBoxColor
        self.uncheckedBoxColor = uncheckedBoxColor
    }
}
