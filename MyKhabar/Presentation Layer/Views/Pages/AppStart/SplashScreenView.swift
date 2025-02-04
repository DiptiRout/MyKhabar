//
//  SplashScreenView.swift
//  MyKhabar
//
//  Created by Diptiranjan Rout on 23/01/25.
//

import SwiftUI

struct SplashScreenView: View {
    
    @AppStorage("hasSeenOnboarding") private var hasSeenOnboarding = false
    @AppStorage("alreadyAuthenticated") private var alreadyAuthenticated = false

    @StateObject private var networkMonitor = NetworkMonitor()

    @State private var isAnimating = false
    @State private var isSplashScreenActive = true

    var body: some View {
        if isSplashScreenActive {
            Image("AppLogo")
                .resizable()
                .scaledToFit()
                .scaleEffect(isAnimating ? 1.0 : 0.8)
                .opacity(isAnimating ? 1 : 0)
                .onAppear {
                    withAnimation(.easeInOut(duration: 0.5)) {
                        isAnimating = true
                    }
                    // Delay before navigating to the main view
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        isSplashScreenActive = false
                    }
                }
        } else {
            
            if hasSeenOnboarding {
                    NetworkAwareView {
                        if alreadyAuthenticated {
                            NavigationWrapper(content: NewsTabsPageContainerView())
//                            NewsTabsPageContainerView()
                        } else {
                            NavigationWrapper(content: AuthenticationPageView())
//                            AuthenticationPageView()
                        }
                    }
                    .environmentObject(networkMonitor)
               } else {
                OnboardingView()
            }
        }
    }
}

#Preview {
    SplashScreenView()
}
