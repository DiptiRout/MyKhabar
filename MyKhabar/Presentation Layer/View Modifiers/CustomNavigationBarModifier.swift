//
//  CustomNavigationBarModifier.swift
//  MyKhabar
//
//  Created by Diptiranjan Rout on 30/01/25.
//


import SwiftUI

struct CustomNavigationBarModifier: ViewModifier {
    let title: String
    let leftImage: String?
    let rightImage: String?
    let showTitle: Bool
    let showLeftImage: Bool
    let showRightImage: Bool
    let leftAction: (() -> Void)?
    let rightAction: (() -> Void)?

    func body(content: Content) -> some View {
        VStack {
            HStack {
                // Left Image Button (if enabled)
                if showLeftImage, let leftImage = leftImage {
                    Button(action: { leftAction?() }) {
                        Image(systemName: leftImage)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                            .foregroundColor(.primary)
                    }
                } else {
                    Spacer()
                        .frame(width: 24) // Maintain alignment
                }

                // Title (if enabled)
                if showTitle {
                    Text(title)
                        .font(.headline)
                        .foregroundColor(.primary)
                        .frame(maxWidth: .infinity, alignment: .center)
                }

                // Right Image Button (if enabled)
                if showRightImage, let rightImage = rightImage {
                    Button(action: { rightAction?() }) {
                        Image(systemName: rightImage)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                            .foregroundColor(.primary)
                    }
                } else {
                    Spacer()
                        .frame(width: 24) // Maintain alignment
                }
            }
            .padding()
//            .background(Color(UIColor.systemBackground).shadow(radius: 1))

            content // Main view content
        }
        .navigationBarHidden(true) // Hide default NavigationBar
    }
}

extension View {
    func customNavigationBar(
        title: String = "",
        leftImage: String? = nil,
        rightImage: String? = nil,
        showTitle: Bool = true,
        showLeftImage: Bool = true,
        showRightImage: Bool = true,
        leftAction: (() -> Void)? = nil,
        rightAction: (() -> Void)? = nil
    ) -> some View {
        self.modifier(CustomNavigationBarModifier(
            title: title,
            leftImage: leftImage,
            rightImage: rightImage,
            showTitle: showTitle,
            showLeftImage: showLeftImage,
            showRightImage: showRightImage,
            leftAction: leftAction,
            rightAction: rightAction
        ))
    }
}


#Preview {
    NavigationStack {
        Text("Testing Navigation View")
            .customNavigationBar(
                        title: "Home",
                        leftImage: "arrow.backward",
                        rightImage: "ellipsis",
                        leftAction: { print("Back tapped") },
                        rightAction: { print("Settings tapped") }
                    )
            .background(Color.red)
    }
}
