//
//  View+Conditions.swift
//  MyKhabar
//
//  Created by Diptiranjan Rout on 24/01/25.
//

import SwiftUI

extension View {
    @ViewBuilder func `if`<Content: View>(_ condition: Bool, apply: (Self) -> Content) -> some View {
        if condition {
            apply(self)
        } else {
            self
        }
    }
}
