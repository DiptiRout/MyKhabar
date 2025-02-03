//
//  DefaultFaceIDAuthRepositoryTest.swift
//  MyKhabar
//
//  Created by Diptiranjan Rout on 03/02/25.
//

import Foundation
import Testing
@testable import MyKhabar


struct DefaultFaceIDAuthRepositoryTest {
    
    @Test
    func testAuthenticateWithFaceIDSuccess() async throws {
        // Mock successful authentication
        let mockLAContext = MockLAContext()
        mockLAContext.canEvaluatePolicyStub = true
        // Simulate success by setting the evaluatePolicyStub
        mockLAContext.evaluatePolicyStub = { policy, reason, reply in
            reply(true, nil) // Simulate success (no error)
        }
        
        let faceIDAuthRepository = DefaultFaceIDAuthRepository(context: mockLAContext)
        
        // Call the method
        let result = try await faceIDAuthRepository.authenticateWithFaceID()
        
        // Assert the result
        #expect(result == true)
    }
    
    @Test
    func testAuthenticateWithFaceIDNotAvailable() async throws {
        // Simulate Face ID not available scenario
        let mockLAContext = MockLAContext()
        mockLAContext.canEvaluatePolicyStub = false // Simulate that Face ID is not available

        let faceIDAuthRepository = DefaultFaceIDAuthRepository(context: mockLAContext)
        
        // Call the method and expect an error
        do {
            _ = try await faceIDAuthRepository.authenticateWithFaceID()
        } catch let error as NSError {
            #expect(error.domain == "FaceID")
            #expect(error.code == -2) // Custom error code for Face ID not available
        }
    }

}

