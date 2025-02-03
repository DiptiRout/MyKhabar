//
//  MapToUserAuthEntity.swift
//  MyKhabar
//
//  Created by Diptiranjan Rout on 28/01/25.
//

import GoogleSignIn

extension GIDGoogleUser {
    
    /// Maps `GIDGoogleUser` to `GoogleUserEntity`
    func toUserAuthEntity() -> GoogleUserEntity {
        return GoogleUserEntity(
            givenName: self.profile?.givenName ?? "No Name",
            profilePicUrl: self.profile?.imageURL(withDimension: 100)?.absoluteString ?? "",
            isLoggedIn: true
        )
    }
}
