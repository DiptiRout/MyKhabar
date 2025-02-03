//
//  AuthTextFieldViewModel.swift
//  MyKhabar
//
//  Created by Diptiranjan Rout on 23/01/25.
//

import SwiftUI


class AuthTextFieldViewModel: ObservableObject {
    var usernameHeader = "Username"
    let passwordHeader = "Password"
    
    @Published var username = ""
    @Published var password = ""
    
    var shouldLogin: Bool {
        guard !username.isValid(.username) || !password.isValid(.password) else { return false }
        return true
    }
    
    func getUsernameError() -> String? {
        guard !username.isEmpty else { return nil }
        if !username.isValid(.username) { return "Invalid Username" }
        return nil
    }
    
    func getPasswordError() -> String? {
        guard !password.isEmpty else { return nil }
        if !password.isValid(.password) { return "Invalid Password" }
        return nil
    }

}
