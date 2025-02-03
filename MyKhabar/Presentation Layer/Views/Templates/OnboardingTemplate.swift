//
//  OnboardingTemplate.swift
//  MyKhabar
//
//  Created by Diptiranjan Rout on 23/01/25.
//

import SwiftUI

struct OnboardingTemplate: View {
    @State private var currentPage = 0 // Tracks the current page index
    let images: [String]               // Array of images for each page
    let titles: [String]               // Array of titles for each page
    let descriptions: [String]         // Array of descriptions for each page
    let presentAction: () -> Void

    var body: some View {
        VStack {
            TabView(selection: $currentPage) {
                // Loop through images, titles, and descriptions
                ForEach(0..<images.count, id: \.self) { index in
                    OnboardingContainerView(
                        imageName: images[index],
                        title: titles[index],
                        description: descriptions[index]
                    )
                    .tag(index)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .animation(.easeInOut, value: currentPage)
            .frame(maxHeight: .infinity)
            
            // Page Indicators (Dots)
            HStack(spacing: 8) {
                ForEach(0..<images.count, id: \.self) { index in
                    Circle()
                        .frame(width: 16, height: 16)
                        .foregroundColor(currentPage == index
                                         ? AppColors.appPrimary
                                         : AppColors.color(grayscale: .placeholder))
                }
                
                Spacer()
                
                // Navigation Buttons
                if currentPage < images.count - 1 {
                    Button(action: {
                        withAnimation {
                            currentPage += 1
                        }
                    }) {
                        Text("Next")
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: ScaledDesign.scaleWidth(85))
                            .background(AppColors.appPrimary)
                            .cornerRadius(8)
                    }
                    .padding(.horizontal)
                } else {
                    Button(action: {
                        presentAction()
                    }) {
                        Text("Get Started")
                            .foregroundColor(.white)
                            .padding()
                            .background(AppColors.appPrimary)
                            .cornerRadius(8)
                    }
                    .padding(.horizontal)
                }
            }
            .padding()
        }
        .background(Color(.systemBackground).ignoresSafeArea())

    }
}

struct OnboardingContainerView: View {
    let imageName: String
    let title: String
    let description: String

    var body: some View {
        VStack(spacing: 20) {
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(height: ScaledDesign.scaleHeight(584))

            VStack(alignment: .leading, spacing: 10) {
                Text(title)
                    .font(AppFonts.font(for: .display, size: .small))
                    .foregroundColor(AppColors.systemPrimary)
                    .multilineTextAlignment(.leading)

                Text(description)
                    .foregroundStyle(AppColors.color(grayscale: .bodyText))
                    .font(AppFonts.font(for: .text, size: .medium))
                    .multilineTextAlignment(.leading)
            }
            .padding(.horizontal)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}


#Preview {
    OnboardingTemplate(images: ["Onboarding1", "Onboarding1"],
                       titles: ["Test Title", "Test Title"],
                       descriptions: ["test descriptions", "test descriptions"]) {
        
    }
}
