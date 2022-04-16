//
//  SignupViewControllerTests.swift
//  PhotoAppTests
//
//  Created by Nazmi Yavuz on 12.04.2022.
//  Copyright © 2022 Nazmi Yavuz. All rights reserved.
//

import XCTest
@testable import PhotoApp

class SignupViewControllerTests: XCTestCase {

    var storyboard: UIStoryboard!
    var sut: SignupViewController!
    
    override func setUpWithError() throws {
        storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(identifier: "SignupViewController") as SignupViewController
        sut.loadViewIfNeeded()
    }
    
    override func tearDownWithError() throws {
        storyboard = nil
        sut = nil
    }
    
    func testSignupViewController_WhenCreated_HasRequiredTextFieldsEmpty() throws {
        let firstNameTextField = try XCTUnwrap(sut.firstNameTextField, "The firstNameTextField is not connected to an IBOutlet")
        let lastNameTextField = try XCTUnwrap(sut.lastNameTextField, "The lastNameTextField is not connected to an IBOutlet")
        let emailTextField = try XCTUnwrap(sut.emailTextField, "The emailTextField is not connected to an IBOutlet")
        let passwordTextField = try XCTUnwrap(sut.passwordTextField, "The passwordTextField is not connected to an IBOutlet")
        let repeatPasswordTextField = try XCTUnwrap(sut.repeatPasswordTextField, "The repeatPasswordTextField is not connected to an IBOutlet")
        
        XCTAssertEqual(firstNameTextField.text, "", "First name text field was not empty when the view controller initially loaded")
        XCTAssertEqual(lastNameTextField.text, "", "Last name text field was not empty when the view controller initially loaded")
        XCTAssertEqual(emailTextField.text, "", "Email text field was not empty when the view controller initially loaded")
        XCTAssertEqual(passwordTextField.text, "","Password text field was not empty when the view controller initially loaded")
        XCTAssertEqual(repeatPasswordTextField.text, "","Repeat Password text field was not empty when the view controller initially loaded")
        
    }

    func testViewController_WhenCreated_HasSignupButtonAndAction() throws {
        // Arrange
        let signupButton: UIButton = try XCTUnwrap(sut.signupButton, "Signup button does not have a referencing outlet")
                
        // Act
        let signupButtonActions = try XCTUnwrap(signupButton.actions(forTarget: sut, forControlEvent: .touchUpInside), "Signup button does not have any actions assigned to it")

        // Assert
        XCTAssertEqual(signupButtonActions.count, 1)
        XCTAssertEqual(signupButtonActions.first, "signupButtonPressed:", "There is no action with a name signupButtonTapped assigned to signup button")
    }
    
    func testViewController_WhenSignupButtonTapped_InvokesSignupProcess() {
        // Arrange
        let mockSignupModelValidator = MockSignupModelValidator()
        let mockSignupWebService = MockSignupWebService()
        let mockSignupViewDelegate = MockSignupViewDelegate()
        
        let mockSignupPresenter = MockSignupPresenter(
            formModelValidator: mockSignupModelValidator,
            webService: mockSignupWebService,
            delegate: mockSignupViewDelegate)
        
        sut.signupPresenter = mockSignupPresenter
        
        // Act
        sut.signupButton.sendActions(for: .touchUpInside)
        
        // Assert
        XCTAssertTrue(mockSignupPresenter.processUserSignupCalled, "The processUserSignup() method was not called on a Presenter object when the signup button was tapped in a SignupViewController")
    }
    
    func testEmailTextField_WhenCreated_HasEmailAddressContentTypeSet() throws {
        let emailTextField = try XCTUnwrap(sut.emailTextField, "The emailTextField is not connected to an IBOutlet")
        
        XCTAssertEqual(emailTextField.textContentType, .emailAddress, "Email text field does not have email address Content Type set.")
    }
    
    func testEmailTextField_WhenCreated_HasEmailAddressKeyboardTypeSet() throws {
        let emailTextField = try XCTUnwrap(sut.emailTextField, "The emailTextField is not connected to an IBOutlet")
        
        XCTAssertEqual(emailTextField.keyboardType, .emailAddress, "Email text field does not have email address Keyboard Type set.")
    }
    
    func testPasswordTextField_WhenCreated_IsSecureTextEntryField() throws {
        let passwordTextField = try XCTUnwrap(sut.passwordTextField, "The passwordTextField is not connected to an IBOutlet")
        
        XCTAssertEqual(passwordTextField.isSecureTextEntry, true, "Password text field was not empty when the view controller initially loaded")
    }
    
    func testRepeatPasswordTextField_WhenCreated_IsSecureTextEntryField() throws {
        let repeatPasswordTextField = try XCTUnwrap(sut.repeatPasswordTextField, "The repeatPasswordTextField is not connected to an IBOutlet")
        
        XCTAssertEqual(repeatPasswordTextField.isSecureTextEntry, true, "Password text field was not empty when the view controller initially loaded")
    }
    
    
}
