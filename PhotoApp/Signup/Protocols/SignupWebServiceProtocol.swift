//
//  SignupWebServiceProtocol.swift
//  PhotoApp
//
//  Created by Nazmi Yavuz on 11.04.2022.
//  Copyright © 2022 Nazmi Yavuz. All rights reserved.
//

import Foundation

protocol SignupWebServiceProtocol {
    
    func signup(withForm formModel: SignupFormRequestModel, completionHandler: @escaping (SignupResponseModel?, SignupError?) -> Void)
    
}
