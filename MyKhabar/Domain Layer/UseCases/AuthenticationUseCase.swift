//
//  AuthenticationUseCase.swift
//  MyKhabar
//
//  Created by Diptiranjan Rout on 28/01/25.
//

import UIKit

protocol AuthenticationUseCaseProtocol: Sendable {
    func restorePreviousSignInGoogle() async throws -> GoogleUserEntity
    func signInGoogle(withPresenting viewController: UIViewController) async throws -> GoogleUserEntity
    func signOutGoogle() -> Bool
    
    func authenticateWithFaceID() async throws -> Bool
}


final class AuthenticationUseCase: AuthenticationUseCaseProtocol {
        
    private let gooleRepository: GoogleAuthRepository
    private let faceIDAuthRepository: FaceIDAuthRepository

    init(gooleRepository: GoogleAuthRepository, faceIDAuthRepository: FaceIDAuthRepository) {
        self.gooleRepository = gooleRepository
        self.faceIDAuthRepository = faceIDAuthRepository
    }
    
    func restorePreviousSignInGoogle() async throws -> GoogleUserEntity {
        try await gooleRepository.restorePreviousSignInGoogle()
    }
    
    func signInGoogle(withPresenting viewController: UIViewController) async throws -> GoogleUserEntity {
        try await gooleRepository.signInGoogle(withPresenting: viewController)
    }
    
    func signOutGoogle() -> Bool {
        gooleRepository.signOutGoogle()
    }
    
    func authenticateWithFaceID() async throws -> Bool {
        try await faceIDAuthRepository.authenticateWithFaceID()
    }
    
    
//    func signIn() {
//        
//    }
//    
//    func signUp() {
//        
//    }
//    
//    func signOut() {
//        
//    }
}
