//
//  MockLAContext.swift
//  MyKhabar
//
//  Created by Diptiranjan Rout on 03/02/25.
//


import LocalAuthentication
import Foundation
@testable import MyKhabar


class MockLAContext: LAContextProtocol {
    var canEvaluatePolicyStub: Bool = true
    var evaluatePolicyStub: ((LAPolicy, String, @escaping (Bool, Error?) -> Void) -> Void)?

    func canEvaluatePolicy(_ policy: LAPolicy, error: NSErrorPointer) -> Bool {
        return canEvaluatePolicyStub
    }

    func evaluatePolicy(_ policy: LAPolicy, localizedReason: String, reply: @escaping (Bool, Error?) -> Void) {
        // Execute the stub closure if available
        if let evaluatePolicyStub = evaluatePolicyStub {
            evaluatePolicyStub(policy, localizedReason, reply)
        } else {
            // Default to failure scenario
            let error = NSError(domain: "FaceID", code: -1, userInfo: [NSLocalizedDescriptionKey: "Authentication failed"])
            reply(false, error) // Simulate failure with an error
        }
    }
}
