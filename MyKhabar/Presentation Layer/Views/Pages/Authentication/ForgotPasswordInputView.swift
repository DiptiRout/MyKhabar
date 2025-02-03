//
//  ForgotPasswordInputView.swift
//  MyKhabar
//
//  Created by Diptiranjan Rout on 31/01/25.
//


import SwiftUI

struct ForgotPasswordInputView: View {
    @State private var text = ""
    @State private var isInputView = false
    @ObservedObject private var router = Router.shared

    var headerText = ""
    
    var body: some View {
        VStack {
            let headerUIModel = MultilineHeaderUIModel(
                headers: [("Forgot", AppFonts.font(for: .display, size: .medium), AppColors.systemPrimary, 1),
                          ("Password?", AppFonts.font(for: .display, size: .medium), AppColors.systemPrimary, 1),
                          ("Don't worry it happens. Please select the email or number assosiated with your account.", AppFonts.font(for: .text, size: .medium), AppColors.color(grayscale: .bodyText), 3)
                         ],
                maxWidth: ScaledDesign.scaleWidth(UIScreen.main.bounds.width / 1.1))
            
            MultilineHeaderView(uiModel: headerUIModel)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            TextField("", text: $text)
                .applyOutlinedStyle(
                    textFieldType: .textField,
                    uiModel: OutlinedTextFieldUIModel(height: ScaledDesign.scaleHeight(48),
                                                      headerText: headerText,
                                                      isMandatory: true
                                                     ))
            Spacer()
            AppPrimaryButton(uiModel: AppPrimaryButtonUIModel(), title: "Submit") {
                router.navigate(to: .otp)
            }
            .applyBottomContainerTopShadow()
        }
    }
}

#Preview {
    ForgotPasswordInputView()
}
