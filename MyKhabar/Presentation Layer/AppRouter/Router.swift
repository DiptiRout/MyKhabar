//
//  Router.swift
//  MyKhabar
//
//  Created by Diptiranjan Rout on 02/02/25.
//

import SwiftUI

class Router: ObservableObject {
    @Published var path: [AppScreens] = []
    
    @MainActor static let shared = Router()

    func navigate(to screen: AppScreens) {
        path.append(screen)
    }
    
    func pop() {
        if !path.isEmpty {
            path.removeLast()
        }
    }
    
    func popToRoot() {
        path.removeAll()
    }
}
