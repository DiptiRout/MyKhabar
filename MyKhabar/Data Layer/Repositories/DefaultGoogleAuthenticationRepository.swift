//
//  AuthRepositoryProtocol.swift
//  MyKhabar
//
//  Created by Diptiranjan Rout on 28/01/25.
//

import SwiftUI
import GoogleSignIn

final class DefaultGoogleAuthenticationRepository: GoogleAuthRepository {
    
    func restorePreviousSignInGoogle() async throws -> GoogleUserEntity {
        let user = try await GIDSignIn.sharedInstance.restorePreviousSignIn()
        return user.toUserAuthEntity()
    }
    
    func signInGoogle(withPresenting viewController: UIViewController) async throws -> GoogleUserEntity {
        
        let result = try await GIDSignIn.sharedInstance.signIn(withPresenting: viewController)
        return result.user.toUserAuthEntity()
    }
    
    func signOutGoogle() -> Bool {
        GIDSignIn.sharedInstance.signOut()
        return true
    }
}
