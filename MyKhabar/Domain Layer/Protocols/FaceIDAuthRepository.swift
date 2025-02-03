//
//  FaceIDAuthRepository.swift
//  MyKhabar
//
//  Created by Diptiranjan Rout on 31/01/25.
//

protocol FaceIDAuthRepository: Sendable {
    func authenticateWithFaceID() async throws -> Bool
}
