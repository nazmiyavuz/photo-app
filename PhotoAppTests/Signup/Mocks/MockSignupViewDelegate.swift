//
//  MockSignupViewDelegate.swift
//  PhotoAppTests
//
//  Created by Nazmi Yavuz on 12.04.2022.
//  Copyright © 2022 Nazmi Yavuz. All rights reserved.
//

import Foundation
import XCTest
@testable import PhotoApp

class MockSignupViewDelegate: SignupViewDelegateProtocol {
    
    var expectation: XCTestExpectation?
    
    func successfulSignup() {
        expectation?.fulfill()
    }
    
    func errorHandler(error: SignupError) {
        //
    }
    
}
