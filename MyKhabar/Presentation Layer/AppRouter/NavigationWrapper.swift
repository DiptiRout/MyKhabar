//
//  NavigationWrapper.swift
//  MyKhabar
//
//  Created by Diptiranjan Rout on 02/02/25.
//

import SwiftUI

struct NavigationWrapper<Content: View>: View {
    @StateObject private var router = Router.shared // Use shared router
    let content: Content

    var body: some View {
        NavigationStack(path: $router.path) {
            content
                .navigationDestination(for: AppScreens.self) { screen in
                    screen.body
                }
        }
    }
}
