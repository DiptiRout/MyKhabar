//
//  RoundedSquareImageModifier.swift
//  MyKhabar
//
//  Created by Diptiranjan Rout on 30/01/25.
//

import SwiftUI

struct RoundedSquareImageModifier: ViewModifier {
    var size: CGFloat
    var cornerRadius: CGFloat

    func body(content: Content) -> some View {
        ZStack {
            Rectangle()
                .fill(Color.gray)
            content
                .scaledToFill()
                .background(.gray)
        }
        .frame(width: size, height: size)
        .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
    }
}

extension View {
    func applyRoundedSquare(size: CGFloat, cornerRadius: CGFloat) -> some View {
        self.modifier(RoundedSquareImageModifier(size: size, cornerRadius: cornerRadius))
    }
}
