//
//  GoogleAuthRepository.swift
//  MyKhabar
//
//  Created by Diptiranjan Rout on 28/01/25.
//

import UIKit

protocol GoogleAuthRepository: Sendable {
    func restorePreviousSignInGoogle() async throws -> GoogleUserEntity
    func signInGoogle(withPresenting viewController: UIViewController) async throws -> GoogleUserEntity
    func signOutGoogle() -> Bool
}

