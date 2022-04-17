//
//  SignupPresenterProtocol.swift
//  PhotoApp
//
//  Created by Nazmi Yavuz on 12.04.2022.
//  Copyright © 2022 Nazmi Yavuz. All rights reserved.
//

import Foundation

protocol SignupPresenterProtocol: AnyObject {
    init(formModelValidator: SignupModelValidatorProtocol,
         webService: SignupWebServiceProtocol,
         delegate: SignupViewDelegateProtocol)
    
    func processUserSignup(formModel: SignupFormModel)
}
