//
//  AppCoordinator.swift
//  MyKhabar
//
//  Created by Diptiranjan Rout on 24/01/25.
//

import SwiftUI

enum AuthenticationType {
    case login
    case signup
}

enum SelectionType {
    case country
    case topics
    case newsSource
}

enum AppScreens: Hashable & View {
    
    case splash
    case onboarding
    case authentication(type: AuthenticationType)
    case forgotPasswordOptions
    case forgotPasswordInput(type: String)
    case otp
    case resetPassword
    case accountConfirm
    case countrySelection
    case catagorySelection
    case categorySelection
    case sourceSelection

    case home
    case explore
    case notification
    case profilePageView
    
    case bookmark
    case bookmarkDetails
    case details(itemId: Int)
    case comment
    case createNews
    
    case settings
    case editProfile
    
    case webView(url: URL)

    var body: some View {
        switch self {
        case .splash:
            SplashScreenView()
        case .onboarding:
            OnboardingView()
        case .authentication(let type):
            AuthenticationPageView()
        case .forgotPasswordOptions:
            ForgotPasswordOptionView()
        case .forgotPasswordInput(let type):
            ForgotPasswordInputView(headerText: type)
        case .otp:
            OTPVerificationView()
        case .resetPassword:
            ResetPasswordView()
        case .accountConfirm:
            AccountConfirmationView()
        case .countrySelection:
            CountrySelectionView()
        case .categorySelection:
            CategorySelectionView()
        case .sourceSelection:
            NewsSourceView()
        case .profilePageView:
            ProfilePageView()
        case .home:
            NewsTabsPageContainerView()
        case .explore:
            NewsExploreView()
        case .notification:
            NotificationView()
        case .bookmark:
            BookmarkPageView()
//        case .bookmarkDetails:
//            <#code#>
//        case .details(let itemId):
//            <#code#>
//        case .comment:
//            <#code#>
//        case .createNews:
//            <#code#>            
//        case .settings:
//            <#code#>
//        case .editProfile:
//            <#code#>
        case .webView(let url):
            SafariView(url: url)
            
        default: SplashScreenView()

        }
    }
}
