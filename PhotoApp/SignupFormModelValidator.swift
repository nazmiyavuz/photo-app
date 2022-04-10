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
    }
}
