//
//  SignupPresenter.swift
//  PhotoApp
//
//  Created by Nazmi Yavuz on 10.04.2022.
//  Copyright © 2022 Nazmi Yavuz. All rights reserved.
//

import Foundation

class SignupPresenter: SignupPresenterProtocol {
    
    private var formModelValidator: SignupModelValidatorProtocol
    private var webService: SignupWebServiceProtocol
    private weak var delegate: SignupViewDelegateProtocol?
    
    required init(formModelValidator: SignupModelValidatorProtocol,
                  webService: SignupWebServiceProtocol,
                  delegate: SignupViewDelegateProtocol) {
        self.formModelValidator = formModelValidator
        self.webService = webService
        self.delegate = delegate
    }
    
    func processUserSignup(formModel: SignupFormModel) {
        
        if !formModelValidator.isFirstNameValid(firstName: formModel.firstName) {
            delegate?.errorHandler(error: SignupError.invalidFirstName)
            return
        }
        
        if !formModelValidator.isLastNameValid(lastName: formModel.lastName) {
            delegate?.errorHandler(error: SignupError.invalidLastName)
            return
        }
        
        if !formModelValidator.isMobilePhoneNumberValid(number: formModel.phoneNumber) {
            delegate?.errorHandler(error: SignupError.invalidNumber)
            return
        }
        
        if !formModelValidator.isValidEmailFormat(email: formModel.email) {
            delegate?.errorHandler(error: SignupError.invalidEmail)
            return
        }
        
        if !formModelValidator.isPasswordValid(password: formModel.password) {
            delegate?.errorHandler(error: SignupError.invalidPassword)
            return
        }
        
        if !formModelValidator.doPasswordsMatch(password: formModel.password, repeatPassword: formModel.repeatPassword) {
            delegate?.errorHandler(error: SignupError.passwordsDoNotMatch)
            return
        }
        
        self.delegate?.successfulSignup()
        
//        let requestModel = SignupFormRequestModel(firstName: formModel.firstName,
//                                                  lastName: formModel.lastName,
//                                                  phoneNumber: formModel.phoneNumber,
//                                                  email: formModel.email,
//                                                  password: formModel.password)
//
//        webService.signup(withForm: requestModel) { [weak self] responseModel, error in
//
//            if let error = error {
//                self?.delegate?.errorHandler(error: error)
//            } else if responseModel != nil {
//                self?.delegate?.successfulSignup()
//            }
//        }
        
    }
}
