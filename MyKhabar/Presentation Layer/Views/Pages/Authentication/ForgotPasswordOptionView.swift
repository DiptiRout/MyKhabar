//
//  ForgotPasswordOptionView.swift
//  MyKhabar
//
//  Created by Diptiranjan Rout on 24/01/25.
//

import SwiftUI

struct ForgotPasswordOptionView: View {
    @State private var text = ""
    @State private var selectedOption: String?
    @State private var isInputView = false
    @ObservedObject private var router = Router.shared
    
    var body: some View {
        VStack {
            let headerUIModel = MultilineHeaderUIModel(
                headers: [("Forgot", AppFonts.font(for: .display, size: .medium), AppColors.systemPrimary, 1),
                          ("Password?", AppFonts.font(for: .display, size: .medium), AppColors.systemPrimary, 1),
                          ("Don't worry it happens. Please select the email or number assosiated with your account.",
                           AppFonts.font(for: .text, size: .medium),
                           AppColors.color(grayscale: .bodyText), 3)
                         ],
                maxWidth: ScaledDesign.scaleWidth(UIScreen.main.bounds.width / 1.1))
            
            MultilineHeaderView(uiModel: headerUIModel)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            AppSecondaryButton(isSelected: selectedOption == "Email ID",
                               optionImage: "envelope") {
                selectedOption = "Email ID"
            }
            AppSecondaryButton(isSelected: selectedOption == "Mobile Number",
                               optionImage: "text.bubble") {
                selectedOption = "Mobile Number"
            }
            
            Spacer()
            AppPrimaryButton(uiModel: AppPrimaryButtonUIModel(), title: "Submit", isDisabled: selectedOption == nil) {
                router.navigate(to: .forgotPasswordInput(type: selectedOption ?? ""))
            }
            .applyBottomContainerTopShadow()
        }
    }
}

#Preview {
    ForgotPasswordOptionView()
}
