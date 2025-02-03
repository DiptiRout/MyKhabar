//
//  AuthenticationPageView.swift
//  MyKhabar
//
//  Created by Diptiranjan Rout on 23/01/25.
//


import SwiftUI


struct AuthenticationPageView: View {
    
    enum AuthenticationType {
        case login
        case signup
    }
    
    @ObservedObject private var router = Router.shared
    @AppStorage("alreadyAuthenticated") private var alreadyAuthenticated = false

    @State private var username = ""
    @State private var password = ""
    @State private var showPassword = false
    @State private var showUsernameError = false
    
    @StateObject var textFieldViewModel = AuthTextFieldViewModel()
    @StateObject var authViewModel = AuthenticationViewModel()

    @Environment(\.dismiss) private var dismiss
    
    @State var authenticationType: AuthenticationType = .login
    @State var isLoginView = false
    
    let headerUIModel = MultilineHeaderUIModel(
        headers: [("Hello", AppFonts.font(for: .display, size: .large), AppColors.systemPrimary, 1),
                  ("Again!", AppFonts.font(for: .display, size: .large), AppColors.appPrimary, 1),
                  ("Welcome back you've been missed", AppFonts.font(for: .text, size: .large), AppColors.color(grayscale: .bodyText), 2)
                 ],
        maxWidth: ScaledDesign.scaleWidth(UIScreen.main.bounds.width / 1.5))
    
    
    var body: some View {
            if authViewModel.isFaceAuthenticated {
                NewsTabsPageContainerView()
            } else {
                ScrollView {
                    VStack() {
                        MultilineHeaderView(uiModel: headerUIModel)
                            .padding(.bottom, 16)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        TextField("", text: $textFieldViewModel.username)
                            .applyOutlinedStyle(
                                textFieldType: .textField,
                                uiModel: OutlinedTextFieldUIModel(height: ScaledDesign.scaleHeight(48), headerText: textFieldViewModel.usernameHeader,
                                                                  isMandatory: true,
                                                                  footerText: textFieldViewModel.getUsernameError() ?? "")
                            )
                            .padding(.bottom, 8)
                        
                        SecureField("", text: $textFieldViewModel.password)
                            .applyOutlinedStyle(textFieldType: .textField,
                                                uiModel: OutlinedTextFieldUIModel(height: ScaledDesign.scaleHeight(48), headerText: textFieldViewModel.passwordHeader,
                                                                                  isMandatory: true,
                                                                                  footerText: textFieldViewModel.getPasswordError() ?? "")
                            )
                        
                        HStack {
                            AuthCheckBoxView(uiModel: AuthCheckBoxUIModel())
                                .padding(.leading)
                            Spacer()
                            if !isLoginView {
                                Button(action: {
                                    router.navigate(to: .forgotPasswordOptions)
                                }) {
                                    Text("Forgot the password ?")
                                        .font(AppFonts.font(for: .text, size: .small))
                                        .foregroundStyle(AppColors.appPrimary)
                                }
                                .padding(.trailing)
                            }
                        }
                        HStack {
                            AppPrimaryButton(uiModel: AppPrimaryButtonUIModel(),
                                             title: "Login",
                                             isDisabled: textFieldViewModel.shouldLogin) {
                                alreadyAuthenticated = true
                                router.navigate(to: .home)
                            }
                            
                            AppPrimaryButton(uiModel: AppPrimaryButtonUIModel(rightImage: Image(systemName: "faceid"), buttonWidth: nil)) {
                                
                                authViewModel.authenticateWithFaceID()
                                if authViewModel.isLoggedIn {
                                    router.navigate(to: .home)
                                }
                            }
                            
                        }
                        .padding()
                        
                        Text("or continue with")
                            .font(AppFonts.font(for: .text, size: .small))
                            .foregroundStyle(AppColors.color(grayscale: .bodyText))
                        
                        HStack {
                            AppPrimaryButton(uiModel: AppPrimaryButtonUIModel(
                                rightImage: Image(systemName: "apple.logo"),
                                backgroundColor: AppColors.color(grayscale: .secondaryButton),
                                foregroundColor: AppColors.color(grayscale: .bodyText),
                                buttonWidth: ScaledDesign.scaleWidth(180)),
                                             title: "Apple"
                            ) {
                                
                            }
                            Spacer()
                            AppPrimaryButton(uiModel: AppPrimaryButtonUIModel(
                                rightImage: Image(systemName: "video.fill"),
                                backgroundColor: AppColors.color(grayscale: .secondaryButton),
                                foregroundColor: AppColors.color(grayscale: .bodyText),
                                buttonWidth: ScaledDesign.scaleWidth(180)),
                                             title: "Google"
                            ) {
                                                                    
                                let rootViewController = UIApplication.shared.connectedScenes
                                    .compactMap { ($0 as? UIWindowScene)?.windows.first?.rootViewController }
                                    .first
                                
                                guard let rootVC = rootViewController else { return }
                                authViewModel.signInGoogle(withPresenting: rootVC)
                            }
                        }
                        .padding()
                        
                        HStack {
                            Text("dont have an account?")
                                .font(AppFonts.font(for: .text, size: .small))
                                .foregroundStyle(AppColors.color(grayscale: .bodyText))
                            Button(action: {
                                isLoginView.toggle()
                            }) {
                                Text("Sign Up")
                                    .font(AppFonts.font(for: .link, size: .medium))
                            }
                        }
                        
                        
                    }
                    
                }
            }
    }
    
    private func attributedString(text: String) -> AttributedString {
        var attributedString = AttributedString(text)
        if let range = Range(NSRange(location: text.count - 1, length: 1), in: text) {
            let attributedStringRange = Range(range, in: attributedString)!
            attributedString[attributedStringRange].foregroundColor = .red
        }
        return attributedString
    }
}

#Preview {
    AuthenticationPageView()
}
