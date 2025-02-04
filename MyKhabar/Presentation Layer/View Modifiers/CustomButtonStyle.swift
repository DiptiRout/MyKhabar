//
//  CustomButtonStyle.swift
//  MyKhabar
//
//  Created by Diptiranjan Rout on 27/01/25.
//

import SwiftUI

struct CustomButtonStyle: ViewModifier {
    
    var backgroundColor: Color = AppColors.appPrimary
    var foregroundColor: Color = AppColors.color(grayscale: .white)
    var cornerRadius: CGFloat = 6
    var padding: CGFloat = 16
    var font: Font = AppFonts.font(for: .link, size: .medium)
    
    func body(content: Content) -> some View {
        content
//            .padding(padding)
            .background(backgroundColor)
            .foregroundColor(foregroundColor)
            .font(font)
            .cornerRadius(cornerRadius)
            .frame(height: 50)
    }
}

extension View {
    func customButtonStyle(
        backgroundColor: Color = AppColors.appPrimary,
        foregroundColor: Color = AppColors.color(grayscale: .white),
        cornerRadius: CGFloat = 6,
        padding: CGFloat = 12,
        font: Font = AppFonts.font(for: .link, size: .medium)
    ) -> some View {
        self.modifier(CustomButtonStyle(
            backgroundColor: backgroundColor,
            foregroundColor: foregroundColor,
            cornerRadius: cornerRadius,
            padding: padding,
            font: font
        ))
    }
}

#Preview(body: {
    Button("Primary Action") {
                    print("Primary button tapped")
                }
                .customButtonStyle(backgroundColor: .blue, foregroundColor: .white)

})
