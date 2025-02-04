//
//  AppFonts.swift
//  MyKhabar
//
//  Created by Diptiranjan Rout on 24/01/25.
//

import SwiftUI

struct AppFonts {
    
    static func font(for category: FontCategory, size: FontSize) -> Font {
        switch (category, size) {
        case (.display, .small): return .custom("Poppins-Bold", size: 24)
        case (.display, .medium): return .custom("Poppins-Bold", size: 32)
        case (.display, .large): return .custom("Poppins-Bold", size: 48)
            
        case (.text, .xSmall): return .custom("Poppins-Regular", size: 13)
        case (.text, .small): return .custom("Poppins-Regular", size: 14)
        case (.text, .medium): return .custom("Poppins-Regular", size: 16)
        case (.text, .large): return .custom("Poppins-Regular", size: 20)
            
        case (.link, .xSmall): return .custom("Poppins-SemiBold", size: 13)
        case (.link, .small): return .custom("Poppins-SemiBold", size: 14)
        case (.link, .medium): return .custom("Poppins-SemiBold", size: 16)
        case (.link, .large): fatalError("Links don't have a large size")

        case (.display, .xSmall):
            return Font.system(.body)
        }
    }
    
    enum FontCategory {
        case display
        case text
        case link
    }
    
    enum FontSize {
        case xSmall
        case small
        case medium
        case large
    }
}
