//
//  MockSignupModelValidator.swift
//  PhotoAppTests
//
//  Created by Nazmi Yavuz on 10.04.2022.
//  Copyright © 2022 Nazmi Yavuz. All rights reserved.
//

import Foundation
@testable import PhotoApp

class MockSignupModelValidator: SignupModelValidatorProtocol {
    
    
    
    var isFirstNameValidated: Bool = false
    var isLastNameValidated: Bool = false
    var isPhoneNumberValidated: Bool = false
    var isEmailFormatValidated: Bool = false
    var isPasswordValidated: Bool = false
    var isPasswordEqualityValidated: Bool = false
    
    func isFirstNameValid(firstName: String) -> Bool {
        isFirstNameValidated = true
        return isFirstNameValidated
    }
    
    func isLastNameValid(lastName: String) -> Bool {
        isLastNameValidated = true
        return isLastNameValidated
    }
    
    func isMobilePhoneNumberValid(number: String) -> Bool {
        isPhoneNumberValidated = true
        return isPhoneNumberValidated
    }
    
    func isValidEmailFormat(email: String) -> Bool {
        isEmailFormatValidated = true
        return isEmailFormatValidated
    }
    
    func isPasswordValid(password: String) -> Bool {
        isPasswordValidated = true
        return isPasswordValidated
    }
    
    func doPasswordsMatch(password: String, repeatPassword: String) -> Bool {
        isPasswordEqualityValidated = true
        return isPasswordEqualityValidated
    }
    
    func isNotIllegalCharacters(in text: String) throws {
        let invalidCharacters = CharacterSet(charactersIn: "{}[]$%*^&/.,@!?")
        
        if text.rangeOfCharacter(from: invalidCharacters) != nil {
            throw SignupError.invalidCharactersFound
        }
    }
    
}
