//
//  UserAuthViewModel.swift
//  MyKhabar
//
//  Created by Diptiranjan Rout on 28/01/25.
//

import SwiftUI
import LocalAuthentication

@MainActor
final class AuthenticationViewModel: ObservableObject {
    
    @Published var givenName: String = ""
    @Published var profilePicUrl: String = ""
    @Published var isLoggedIn: Bool = false
    @Published var errorMessage: String = ""
    @Published var isFaceAuthenticated = false

    @Dependency private var authenticationUseCase: AuthenticationUseCaseProtocol
    
    func checkStatus() {
        Task {
            do {
                let user = try await authenticationUseCase.restorePreviousSignInGoogle()
                update(with: user)
            } catch let error {
                update(with: error)
            }
        }
    }

    func signInGoogle(withPresenting viewController: UIViewController) {
        Task {
            do {
                let user = try await self.authenticationUseCase.signInGoogle(withPresenting: viewController)
                update(with: user)
            } catch let error {
                update(with: error)
            }
        }
    }

    func signOutGoogle() {
        self.isLoggedIn = authenticationUseCase.signOutGoogle()
    }
    
    private func update(with user: GoogleUserEntity) {
        self.givenName = user.givenName
        self.profilePicUrl = user.profilePicUrl
        self.isLoggedIn = user.isLoggedIn
    }
    
    private func update(with error: Error) {
        self.errorMessage = error.localizedDescription
    }
}

extension AuthenticationViewModel {
    
    func authenticateWithFaceID() {
        Task {
            do {
                isFaceAuthenticated = try await authenticationUseCase.authenticateWithFaceID()
            } catch let error {
                errorMessage = error.localizedDescription
            }
        }
    }
}
