//
//  SignupModelValidatorProtocol.swift
//  PhotoApp
//
//  Created by Nazmi Yavuz on 10.04.2022.
//  Copyright © 2022 Nazmi Yavuz. All rights reserved.
//

import Foundation

protocol SignupModelValidatorProtocol {
    
    // first name
    func isFirstNameValid(firstName: String) -> Bool
    // last name
    func isLastNameValid(lastName: String) -> Bool
    // email
    func isValidEmailFormat(email: String) -> Bool
    // password
    func isPasswordValid(password: String) -> Bool
    func doPasswordsMatch(password: String, repeatPassword: String) -> Bool
    
}
