//
//  SignupPresenterTests.swift
//  PhotoAppTests
//
//  Created by Nazmi Yavuz on 10.04.2022.
//  Copyright © 2022 Nazmi Yavuz. All rights reserved.
//

import XCTest
@testable import PhotoApp

class SignupPresenterTests: XCTestCase {
    
    var signupFormModel: SignupFormModel!
    var mockSignupModelValidator: MockSignupModelValidator!
    var mockSignupWebService: MockSignupWebService!
    var sut: SignupPresenter!

    override func setUp() {
        // Arrange
        signupFormModel = SignupFormModel(firstName: "Nazmi",
                                          lastName: "Yavuz",
                                          email: "nazmi@mail.com",
                                          password: "12345678",
                                          repeatPassword: "12345678")

        mockSignupModelValidator = MockSignupModelValidator()
        mockSignupWebService = MockSignupWebService()
        sut = SignupPresenter(formModelValidator: mockSignupModelValidator,
                                  webService: mockSignupWebService)
    }

    override func tearDown() {
        signupFormModel = nil
        mockSignupModelValidator = nil
        mockSignupWebService = nil
        sut = nil
    }
    
    func testSignupPresenter_WhenInformationProvided_WillValidateEachProperty() {
        // Arrange
        // Act
        sut.processUserSignup(formModel: signupFormModel)
        // Assert
        XCTAssertTrue(mockSignupModelValidator.isFirstNameValidated, "First name was not validated")
        XCTAssertTrue(mockSignupModelValidator.isLastNameValidated, "Last name was not validated")
        XCTAssertTrue(mockSignupModelValidator.isEmailFormatValidated, "Email format was not validated")
        XCTAssertTrue(mockSignupModelValidator.isPasswordValidated, "Password was not validated")
        XCTAssertTrue(mockSignupModelValidator.isPasswordEqualityValidated, "Did not validate if passwords match")
    }
    
    func testSignupPresenter_WhenGivenValidFormModel_ShouldCallSignupMethod() {
        // Arrange
        // Act
        sut.processUserSignup(formModel: signupFormModel)
        // Assert
        XCTAssertTrue(mockSignupWebService.isSignupMethodCalled, "The signup() method was not called in the SignupWebService class")
    }
    
//    func testSignupPresenter_WhenSignupOperationSuccessful_ShouldCallSignupMethod
}
