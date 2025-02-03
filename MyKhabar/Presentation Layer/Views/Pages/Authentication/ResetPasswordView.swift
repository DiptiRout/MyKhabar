//
//  ResetPasswordView.swift
//  MyKhabar
//
//  Created by Diptiranjan Rout on 26/01/25.
//

import SwiftUI


struct ResetPasswordView: View {
    
    @StateObject var textFieldViewModel = AuthTextFieldViewModel()
    @ObservedObject private var router = Router.shared
    
    let headerUIModel = MultilineHeaderUIModel(
        headers: [("Hello", AppFonts.font(for: .display, size: .large), AppColors.systemPrimary, 1),
                  ("Again!", AppFonts.font(for: .display, size: .large), AppColors.appPrimary, 1),
                  ("Welcome back you've been missed", AppFonts.font(for: .text, size: .large), AppColors.color(grayscale: .bodyText), 2)
                 ],
        maxWidth: ScaledDesign.scaleWidth(UIScreen.main.bounds.width / 1.5))
    
    var body: some View {
        VStack {
            MultilineHeaderView(uiModel: headerUIModel)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            SecureField("", text: $textFieldViewModel.password)
                .applyOutlinedStyle(textFieldType: .textField,
                                  uiModel: OutlinedTextFieldUIModel(height: ScaledDesign.scaleHeight(48),
                                                               headerText: "New Password",
                                                               isMandatory: true
                                                              ))
                .padding(.bottom, 8)
            
            SecureField("", text: $textFieldViewModel.password)
                .applyOutlinedStyle(textFieldType: .textField,
                                  uiModel: OutlinedTextFieldUIModel(height: ScaledDesign.scaleHeight(48),
                                                               headerText: "Confirm New Password",
                                                               isMandatory: true
                                                              ))
            
            Spacer()
            AppPrimaryButton(uiModel: AppPrimaryButtonUIModel(), title: "Submit") {
                router.navigate(to: .accountConfirm)
            }
            .applyBottomContainerTopShadow()
            
        }
    }
}

#Preview {
    ResetPasswordView()
}
