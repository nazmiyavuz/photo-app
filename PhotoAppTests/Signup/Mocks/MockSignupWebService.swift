//
//  MockSignupWebService.swift
//  PhotoAppTests
//
//  Created by Nazmi Yavuz on 11.04.2022.
//  Copyright © 2022 Nazmi Yavuz. All rights reserved.
//

import Foundation
@testable import PhotoApp

class MockSignupWebService: SignupWebServiceProtocol {
    
    var isSignupMethodCalled: Bool = false
    
    func signup(withForm formModel: SignupFormRequestModel, completionHandler: @escaping (SignupResponseModel?, SignupError?) -> Void) {
        
        isSignupMethodCalled = true
        
    }
}
