//
//  FocusModifier.swift
//  MyKhabar
//
//  Created by Diptiranjan Rout on 27/01/25.
//

import SwiftUI

struct FocusModifier: ViewModifier {
    
    @Binding var isFocused: Bool

    func body(content: Content) -> some View {
        content
            .onTapGesture {
                isFocused = true
            }
            .onChange(of: isFocused) { newFocus in
                // You could add additional logic here if needed
            }
    }
}

extension View {
    func focusHandling(isFocused: Binding<Bool>) -> some View {
        self.modifier(FocusModifier(isFocused: isFocused))
    }
}

struct BottomContainerViewModifier: ViewModifier {
    
    var height: CGFloat = 130
    
    func body(content: Content) -> some View {
        ZStack {
            Rectangle()
                .foregroundColor(.white)
                .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: -2)
                .ignoresSafeArea(edges: .bottom)
            
            content
            .padding()

        }
        .frame(height: height)
    }
}

extension View {
    func applyBottomContainerTopShadow(height: CGFloat = 130) -> some View {
        self.modifier(BottomContainerViewModifier(height: height))
    }
}
