//
//  String+Valdidations.swift
//  MyKhabar
//
//  Created by Diptiranjan Rout on 23/01/25.
//

import Foundation

extension String {
    
    enum ValidationType {
        
        /// ^[A-Za-z0-9._%+-]+: Matches the username part of the email (letters, digits, and special characters).
        /// @: Ensures the "@" symbol is present.
        /// [A-Za-z0-9.-]+: Matches the domain name.
        /// \\.[A-Za-z]{2,}: Matches the top-level domain (e.g., .com).
        case emailAddress
        
        /// ^ and $: Start and end of the string.
        /// (?!.*[_.]{2}): Ensures no consecutive underscores or dots.
        /// [a-zA-Z0-9._]{3,20}: Allows letters, numbers, dots, and underscores with a length of 3–20 characters.
        case username
        
        /// ^ and $: Start and end of the string.
        /// (?=.*[A-Z]): At least one uppercase letter.
        /// (?=.*[a-z]): At least one lowercase letter.
        /// (?=.*\\d): At least one number.
        /// (?=.*[@$!%*?&]): At least one special character.
        /// [A-Za-z\\d@$!%*?&]{8,}: Allows the defined characters with a minimum length of 8.
        case password

        fileprivate var regex: String {
            switch self {
            case .emailAddress:
                return "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
            case .username:
                return "^(?!.*[_.]{2})[a-zA-Z0-9._]{3,20}$"
            case .password:
                return "^(?=.*[A-Z])(?=.*[a-z])(?=.*\\d)(?=.*[@$!%*?&])[A-Za-z\\d@$!%*?&]{8,}$"
            }
        }
    }
    
    func isValid(_ type: ValidationType) -> Bool {
        guard !isEmpty else { return false }
        let regTest = NSPredicate(format: "SELF MATCHES %@", type.regex)
        return regTest.evaluate(with: self)
    }
}
