//
//  SignupFormModelValidator.swift
//  PhotoApp
//
//  Created by Nazmi Yavuz on 10.04.2022.
//

import Foundation

class SignupFormModelValidator {
    
    func isFirstNameValid(firstName: String) -> Bool {
        return !firstName.isEmpty
        && firstName.count >= SignupConstants.firstNameMinLength
        && firstName.count <= SignupConstants.firstNameMaxLength
    }
    
    func isLastNameValid(firstName: String) -> Bool {
        return !firstName.isEmpty
        && firstName.count >= SignupConstants.lastNameMinLength
        && firstName.count <= SignupConstants.lastNameMaxLength
    }
    
//    func isValidEmailFormat(email: String) -> Bool {
//       return NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}").evaluate(with: email)
//    }
}
