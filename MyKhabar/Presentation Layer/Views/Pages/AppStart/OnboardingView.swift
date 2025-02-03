//
//  OnboardingView.swift
//  MyKhabar
//
//  Created by Diptiranjan Rout on 23/01/25.
//


import SwiftUI

struct OnboardingView: View {
    @AppStorage("hasSeenOnboarding") private var hasSeenOnboarding = false
    @State private var currentPage = 0
    @State private var showAuthView = false

    var body: some View {
            OnboardingTemplate(
                images: ["Onboarding1", "Onboarding2", "Onboarding3"],
                titles: ["Welcome to the App", "Stay Organized", "Achieve Your Goals"],
                descriptions: [
                    "Discover amazing features and enjoy a seamless experience.",
                    "Keep track of everything in one place with ease.",
                    "Get reminders and insights to stay on track."
                ]
            ) {
                showAuthView = true
                hasSeenOnboarding = true
            }
            .fullScreenCover(isPresented: $showAuthView) {
                AuthenticationPageView()
            }
    }
}


#Preview {
    OnboardingView()
}
