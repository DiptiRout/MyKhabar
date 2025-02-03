//
//  AccountConfirmationView.swift
//  MyKhabar
//
//  Created by Diptiranjan Rout on 26/01/25.
//

import SwiftUI

struct AccountConfirmationView: View {
    
    @ObservedObject private var router = Router.shared
    @State private var isAnimating = false

    var body: some View {
        ZStack {
            VStack {
                Image("AppLogo")
                    .resizable()
                    .scaledToFit()
                    .scaleEffect(isAnimating ? 1.0 : 0.8)
                    .opacity(isAnimating ? 1 : 0)
                    .onAppear {
                        withAnimation(.easeInOut(duration: 0.5)) {
                            isAnimating = true
                        }
                    }
                Text("Congratulations!")
                    .font(AppFonts.font(for: .display, size: .medium))
                Text("Your account is ready to use.")
                    .font(AppFonts.font(for: .text, size: .large))
                    .foregroundStyle(AppColors.color(grayscale: .bodyText))
            }
            VStack {
                Spacer()
                ZStack {
                    Rectangle()
                        .foregroundColor(.white)
                        .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: -2)
                        .ignoresSafeArea(edges: .bottom)
                    
                    AppPrimaryButton(uiModel: AppPrimaryButtonUIModel(), title: "Submit") {
                        router.navigate(to: .countrySelection)
                    }
                    .padding()
                    
                }
                .frame(height: 130)
            }
        }
    }
}

#Preview {
    AccountConfirmationView()
}
