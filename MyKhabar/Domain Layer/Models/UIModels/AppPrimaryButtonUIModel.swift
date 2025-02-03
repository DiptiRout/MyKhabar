//
//  AppPrimaryButtonUIModel.swift
//  MyKhabar
//
//  Created by Diptiranjan Rout on 27/01/25.
//

import SwiftUI

struct AppPrimaryButtonUIModel {
    var titleFont: Font
    var rightImage: Image?
    var rightImageSize: CGSize
    var backgroundColor: Color
    var foregroundColor: Color
    var cornerRadius: CGFloat
    var buttonHeight: CGFloat?
    var buttonWidth: CGFloat?
    
    init(titleFont: Font = AppFonts.font(for: .link, size: .medium),
         rightImage: Image? = nil,
         rightImageSize: CGSize = CGSize(width: 20, height: 20),
         backgroundColor: Color = AppColors.appPrimary,
         foregroundColor: Color = AppColors.color(grayscale: .white),
         cornerRadius: CGFloat = 6,
         buttonHeight: CGFloat = 50,
         buttonWidth: CGFloat? = .infinity
    ) {
        
        self.titleFont = titleFont
        self.rightImage = rightImage
        self.rightImageSize = rightImageSize
        self.backgroundColor = backgroundColor
        self.foregroundColor = foregroundColor
        self.cornerRadius = cornerRadius
        self.buttonHeight = buttonHeight
        self.buttonWidth = buttonWidth
    }
}
