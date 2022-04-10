//
//  SignupFormModelValidator.swift
//  PhotoAppTests
//
//  Created by Nazmi Yavuz on 10.04.2022.
//

import XCTest
@testable import PhotoApp

class SignupFormModelValidatorTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testSignupFormModelValidator_WhenValidFirstNameProvided_ShouldReturnTrue() {
        
        // Arrange
        let sut = SignupFormModelValidator()
        
        // Act
        let isFirstNameValid = sut.isFirstNameValid(firstName: "Nazmi")
        
        // Assert
        XCTAssertTrue(isFirstNameValid, "The isFirstNameValid() should have return TRUE for a valid first name but returned FALSE")
    }

}
