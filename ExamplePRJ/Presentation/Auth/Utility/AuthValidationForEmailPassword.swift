//
//  AuthValidationForEmailPassword.swift
//  ExamplePRJ
//
//  Created by Andrei Ziamlianski on 03/10/2024.
//

import Foundation

final class AuthValidation{
    
    class func emailIsValid(_ email: String?) -> Bool{
        guard let email = email else { return false }
        let firstpart = "[A-Z0-9a-z]([A-Z0-9a-z._%+-]{0,63}[A-Z0-9a-z])?"
        let serverpart = "([A-Z0-9a-z]([A-Z0-9a-z-]{0,30}[A-Z0-9a-z])?\\.){1,5}"
        let emailRegex = firstpart + "@" + serverpart + "[A-Za-z]{2,8}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegex)
       
        return emailTest.evaluate(with: email)
    }
    
    class func passwordIsValid(_ pass: String?) -> Bool {
        guard let pass = pass else { return false }
        return !pass.isEmpty
    }
}
