//
//  OTPVerificationView.swift
//  MyKhabar
//
//  Created by Diptiranjan Rout on 25/01/25.
//

import SwiftUI
import Combine

struct OTPVerificationView: View {
    
    @ObservedObject private var router = Router.shared
    @State private var otpText: String = "1234"
    @State private var resendButtonDisable: Bool = true
    @State private var timerSeconds: Int = 10
    @State private var timerCancellable: Cancellable?
    let timerPublisher = Timer.publish(every: 1.0, on: .main, in: .common)
    
    var body: some View {
        
        VStack {
            Text("OTP Verification")
                .font(AppFonts.font(for: .display, size: .medium))
                .padding()
            Text("Enter the OTP sent to +91-xxxxxxxxxx")
                .font(AppFonts.font(for: .text, size: .medium))
                .foregroundStyle(AppColors.color(grayscale: .bodyText))
                .padding(.bottom, 16)
            OTPFieldView(numberOfFields: 4, otp: $otpText)
            
            // Resend OTP button
            HStack {
                if resendButtonDisable {
                    Text("Resend code in")
                    Text("\(timerSeconds)s")
                        .foregroundStyle(.red)
                } else {
                    Button {
                        
                    } label: {
                        Text("Re-send")
                    }
                }
            }
            .padding()
            .onReceive(timerPublisher) { _ in
                if timerSeconds > 0 {
                    timerSeconds -= 1
                } else {
                    resendButtonDisable = false
                    timerCancellable?.cancel()
                }
            }
            Spacer()
            
            AppPrimaryButton(uiModel: AppPrimaryButtonUIModel(), title: "Verify") {
                router.navigate(to: .resetPassword)
            }
            .applyBottomContainerTopShadow()
        }
        .onAppear {
            startTimer()
        }
    }
    
    private func startTimer() {
        resendButtonDisable = true
        timerSeconds = 10 // Reset to 30 seconds or any value you'd like to start with
        
        // Cancel any existing timer if it's running
        timerCancellable?.cancel()
        
        // Subscribe to the timer publisher
        timerCancellable = timerPublisher.connect()

    }
    
}

#Preview {
    OTPVerificationView()
}
