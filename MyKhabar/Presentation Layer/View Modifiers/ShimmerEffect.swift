//
//  ShimmerEffect.swift
//  MyKhabar
//
//  Created by Diptiranjan Rout on 30/01/25.
//


import SwiftUI

struct ShimmerEffect: ViewModifier {
    @State private var animationAmount = -1.0

    func body(content: Content) -> some View {
        content
            .overlay(
                LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.2), Color.white.opacity(0.5), Color.white.opacity(0.2)]), startPoint: .leading, endPoint: .trailing)
                    .rotationEffect(.degrees(70))
                    .offset(x: CGFloat(animationAmount * 200), y: 0)
                    .animation(Animation.linear(duration: 1.5).repeatForever(autoreverses: false), value: animationAmount)
            )
            .onAppear {
                animationAmount = 1
            }
    }
}
