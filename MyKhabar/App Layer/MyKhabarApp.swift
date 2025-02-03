//
//  MyKhabarApp.swift
//  MyKhabar
//
//  Created by Diptiranjan Rout on 23/01/25.
//

import SwiftUI
import GoogleSignIn

@main
struct MyKhabarApp: App {
    
    init() {
        DependencyInjector.setup()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
