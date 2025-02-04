//
//  DefaultFaceIDAuthRepository.swift
//  MyKhabar
//
//  Created by Diptiranjan Rout on 31/01/25.
//

import SwiftUI
import LocalAuthentication

// Define a protocol to make LAContext testable
protocol LAContextProtocol {
    func canEvaluatePolicy(_ policy: LAPolicy, error: NSErrorPointer) -> Bool
    func evaluatePolicy(_ policy: LAPolicy, localizedReason: String, reply: @escaping (Bool, Error?) -> Void)
}

// Extend LAContext to conform to LAContextProtocol
extension LAContext: LAContextProtocol {}

final actor DefaultFaceIDAuthRepository: FaceIDAuthRepository {
    
    private let context: LAContextProtocol
        
        // Dependency Injection via constructor
        init(context: LAContextProtocol = LAContext()) {
            self.context = context
        }
    
    func authenticateWithFaceID() async throws -> Bool {
        let context = LAContext()
        return try await withCheckedThrowingContinuation { continuation in
            if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil) {
                let reason = "Use Face ID to log in to your account."
                
                context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics,
                                       localizedReason: reason) { success, error in
                    DispatchQueue.main.async {
                        if success {
                            continuation.resume(returning: true) // ✅ Return success
                        } else {
                            continuation.resume(throwing: error ??
                                                NSError(domain: "FaceID",
                                                        code: -1,
                                                        userInfo:
                                                            [NSLocalizedDescriptionKey: "Authentication failed."]))
                        }
                    }
                }
            } else {
                continuation.resume(throwing: NSError(domain: "FaceID",
                                                      code: -2,
                                                      userInfo:
                                                        [NSLocalizedDescriptionKey: "Face ID is not available on this device."]))
            }
        }
    }
}
