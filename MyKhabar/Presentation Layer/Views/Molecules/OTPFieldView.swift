//
//  OTPView.swift
//  MyKhabar
//
//  Created by Diptiranjan Rout on 25/01/25.
//

import SwiftUI
import Combine


// A SwiftUI view for entering OTP (One-Time Password).
struct OTPFieldView: View {
    
    @FocusState private var pinFocusState: FocusPin?
    @Binding private var otp: String
    @State private var pins: [String]
    @State private var showError = true

    var numberOfFields: Int
    
    enum FocusPin: Hashable {
        case pin(Int)
    }
    
    init(numberOfFields: Int, otp: Binding<String>) {
        self.numberOfFields = numberOfFields
        self._otp = otp
        self._pins = State(initialValue: Array(repeating: "", count: numberOfFields))
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 16) {
                ForEach(0..<numberOfFields, id: \.self) { index in
                    TextField("", text: $pins[index])
                        .modifier(OtpModifier(pin: $pins[index], showError: $showError))
                        .onChange(of: pins[index]) { newVal in
                            if newVal.count == 1 {
                                if index < numberOfFields - 1 {
                                    pinFocusState = FocusPin.pin(index + 1)
                                } else {
                                    // Clear focus after the last digit
                                    pinFocusState = nil
                                }
                            }
                            else if newVal.count == numberOfFields, let intValue = Int(newVal) {
                                // Pasted value
                                otp = newVal
                                updatePinsFromOTP()
                                pinFocusState = FocusPin.pin(numberOfFields - 1)
                            }
                            else if newVal.isEmpty {
                                if index > 0 {
                                    pinFocusState = FocusPin.pin(index - 1)
                                }
                            }
                            updateOTPString()
                        }
                        .focused($pinFocusState, equals: FocusPin.pin(index))
                        .onTapGesture {
                            // Set focus to the current field when tapped
                            pinFocusState = FocusPin.pin(index)
                        }
                }
                .background(showError ? AppColors.color(error: .light).opacity(0.3) : Color.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 6)
                        .stroke(showError ? AppColors.color(error: .dark) : Color.gray, lineWidth: 1)
                )
            }
            .onAppear {
                // Initialize pins based on the OTP string
                updatePinsFromOTP()
            }
            
            if showError {
                /// Footer View
                HStack {
                    Image(systemName: "exclamationmark.circle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 16, height: 16)
                    
                    Text("Invalid OTP")
                        .font(AppFonts.font(for: .text, size: .small))
                }
                .foregroundStyle(AppColors.color(error: .dark))

            }
        }
    }
    
    private func updatePinsFromOTP() {
        let otpArray = Array(otp.prefix(numberOfFields))
        for (index, char) in otpArray.enumerated() {
            pins[index] = String(char)
        }
    }
    
    private func updateOTPString() {
        otp = pins.joined()
    }
}

struct OtpModifier: ViewModifier {
    @Binding var pin: String
    @Binding var showError: Bool
    
    var textLimit = 1
    
    func limitText(_ upper: Int) {
        if pin.count > upper {
            self.pin = String(pin.prefix(upper))
        }
    }
    
    func body(content: Content) -> some View {
        content
            .multilineTextAlignment(.center)
            .keyboardType(.numberPad)
            .onReceive(Just(pin)) { _ in limitText(textLimit) }
            .frame(width: ScaledDesign.scaleWidth(64), height: ScaledDesign.scaleHeight(64))
            .font(AppFonts.font(for: .display, size: .medium))
    }
}

#Preview {
    OTPFieldView(numberOfFields: 4, otp: .constant("1234"))
}
