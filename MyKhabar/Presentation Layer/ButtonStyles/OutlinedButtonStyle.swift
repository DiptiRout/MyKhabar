//
//  OutlinedButtonStyle.swift
//  MyKhabar
//
//  Created by Diptiranjan Rout on 27/01/25.
//


import SwiftUI

struct OutlinedButtonStyle: ButtonStyle {
    
    let borderColor: Color
    let cornerRadius: CGFloat
    let borderWidth: CGFloat
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .background(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(borderColor, lineWidth: borderWidth)
            )
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            .animation(.easeInOut(duration: 0.2), value: configuration.isPressed)
    }
}
