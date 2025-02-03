//
//  AppColors.swift
//  MyKhabar
//
//  Created by Diptiranjan Rout on 25/01/25.
//

import SwiftUI

struct AppColors {
    
    enum Grayscale {
        case bodyText
        case secondaryButton
        case placeholder
        case buttonText
        case white
        case titleActive
    }
    
    enum Error {
        case dark
        case light
    }
    
    static let systemPrimary = Color.primary
    static let appPrimary = Color("primaryDefault")
    
    
    static func color(grayscale: Grayscale) -> Color {
        switch grayscale {
        case .bodyText:
            Color("grayscaleBodyText")
        case .secondaryButton:
            Color("grayscaleSecondaryButton")
        case .placeholder:
            Color("grayscalePlaceholder")
        case .buttonText:
            Color("grayscaleButtonText")
        case .white:
                .white
        case .titleActive:
                .black
        }
    }
    
    static func color(error: Error) -> Color {
        switch error {
        case .dark:
            Color("errorDark")
        case .light:
            Color("errorLight")
        }
    }
}
