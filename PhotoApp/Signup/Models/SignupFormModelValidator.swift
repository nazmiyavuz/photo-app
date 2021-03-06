//
//  SignupFormModelValidator.swift
//  PhotoApp
//
//  Created by Nazmi Yavuz on 10.04.2022.
//

import Foundation

class SignupFormModelValidator: SignupModelValidatorProtocol {
        // first name
    func isFirstNameValid(firstName: String) -> Bool {
        return !firstName.isEmpty
        && firstName.count >= SignupConstants.firstNameMinLength
        && firstName.count <= SignupConstants.firstNameMaxLength
    }
    // last name
    func isLastNameValid(lastName: String) -> Bool {
        return !lastName.isEmpty
        && lastName.count >= SignupConstants.lastNameMinLength
        && lastName.count <= SignupConstants.lastNameMaxLength
    }
    // mobile Phone
    func isMobilePhoneNumberValid(number: String) -> Bool {
        return !number.isEmpty
        && number.count == SignupConstants.phoneNumberLength
    }
    // email
    func isValidEmailFormat(email: String) -> Bool {
       return NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}").evaluate(with: email)
    }
    // password
    func isPasswordValid(password: String) -> Bool {
        return !password.isEmpty
        && password.count >= SignupConstants.passwordMinLength
        && password.count <= SignupConstants.passwordMaxLength
    }
    
    func doPasswordsMatch(password: String, repeatPassword: String) -> Bool {
        return password == repeatPassword
    }
    
    // I know that it's not logical but I only wanted to test a func with throws.
    func isNotIllegalCharacters(in text: String) throws {
        let invalidCharacters = CharacterSet(charactersIn: "{}[]$%*^&/.,@!?")
        
        if text.rangeOfCharacter(from: invalidCharacters) != nil {
            throw SignupError.invalidCharactersFound
        }
    }
}
