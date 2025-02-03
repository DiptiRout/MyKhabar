//
//  ScaledDesign.swift
//  MyKhabar
//
//  Created by Diptiranjan Rout on 23/01/25.
//


import SwiftUI


@MainActor
struct ScaledDesign {
    
    /// The base width of the design from Figma in points.
    private static let baseWidth: CGFloat = 428 // Figma design width in points
    
    /// The base height of the design from Figma in points.
    private static let baseHeight: CGFloat = 926 // Figma design height in points
    
    
    /**
     Scales a given width from Figma design to match the current device's screen width.
     
     Formula:
     ```
     Scale Factor = Device Screen Width / Figma Design Width
     Scaled Width = Original Figma Width × Scale Factor
     ```
     
     Example:
     - For a button width of `150` points in Figma:
     ```
     Scaled Width = 150 × (Device Screen Width / 375)
     ```
     
     - If the screen width is `430` (e.g., iPhone 16 Pro):
     ```
     Scaled Width = 150 × (430 / 375) = 172 points
     ```
     
     - Parameter originalSize: The width value from the Figma design.
     - Returns: The scaled width value for the current device.
     */
    static func scaleWidth(_ originalSize: CGFloat) -> CGFloat {
        let screenWidth = UIScreen.main.bounds.width
        return originalSize * (screenWidth / baseWidth)
    }
    
    
    /**
     Scales a given height from Figma design to match the current device's screen height.
     
     Formula:
     ```
     Scale Factor = Device Screen Height / Figma Design Height
     Scaled Height = Original Figma Height × Scale Factor
     ```
     
     Example:
     - For a height of `50` points in Figma:
     ```
     Scaled Height = 50 × (Device Screen Height / 812)
     ```
     
     - If the screen height is `932` (e.g., iPhone 16 Pro):
     ```
     Scaled Height = 50 × (932 / 812) = 57.4 points
     ```
     
     - Parameter originalSize: The height value from the Figma design.
     - Returns: The scaled height value for the current device.
     */
    static func scaleHeight(_ originalSize: CGFloat) -> CGFloat {
        let screenHeight = UIScreen.main.bounds.height
        return originalSize * (screenHeight / baseHeight)
    }
}
