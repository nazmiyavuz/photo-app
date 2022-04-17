//
//  SignupFlowUITests.swift
//  SignupFlowUITests
//
//  Created by Nazmi Yavuz on 16.04.2022.
//  Copyright © 2022 Nazmi Yavuz. All rights reserved.
//

import XCTest

class SignupFlowUITests: XCTestCase {
    
    private var app: XCUIApplication!
    
    private var firstName: XCUIElement!
    private var lastName: XCUIElement!
    private var mobilePhone: XCUIElement!
    private var email: XCUIElement!
    private var password: XCUIElement!
    private var repeatPassword: XCUIElement!
    private var signupButton: XCUIElement!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        app = XCUIApplication()
        app.launch()
        
        firstName = app.textFields["firstNameTextField"]
        lastName = app.textFields["lastNameTextField"]
        mobilePhone = app.textFields["mobilePhoneTextField"]
        email = app.textFields["emailTextField"]
        password = app.secureTextFields["passwordTextField"]
        repeatPassword = app.secureTextFields["repeatPasswordTextField"]
        signupButton = app.buttons["signupButton"].staticTexts["Sign Up"]

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        app = nil
        firstName = nil
        lastName = nil
        mobilePhone = nil
        email = nil
        password = nil
        repeatPassword = nil
        signupButton = nil
        
        try super.tearDownWithError()
    }

    func testSignupViewController_WhenViewLoaded_RequiredUIElementsAreEnabled() throws {
        // UI tests must launch the application that they test.
        
        XCTAssertTrue(firstName.isEnabled, "First name UITextField is not enabled for user interactions")
        XCTAssertTrue(lastName.isEnabled, "Last name UITextField is not enabled for user interactions")
        XCTAssertTrue(mobilePhone.isEnabled, "Mobile phone UITextField is not enabled for user interactions")
        XCTAssertTrue(email.isEnabled, "Email UITextField is not enabled for user interactions")
        XCTAssertTrue(password.isEnabled, "Password UITextField is not enabled for user interactions")
        XCTAssertTrue(repeatPassword.isEnabled, "Repeat password UITextField is not enabled for user interactions")
        XCTAssertTrue(signupButton.isEnabled, "Signup button is not enabled for user interactions")
    }
    // with accessibility identifier in storyboard
    func testSignupViewController_WhenViewLoaded_RequiredUIElementsAreEnabled_V2() throws {
        // UI tests must launch the application that they test.
        
        XCTAssertTrue(firstName.isEnabled, "First name UITextField is not enabled for user interactions")
        XCTAssertTrue(lastName.isEnabled, "Last name UITextField is not enabled for user interactions")
        XCTAssertTrue(mobilePhone.isEnabled, "Mobile phone UITextField is not enabled for user interactions")
        XCTAssertTrue(email.isEnabled, "Email UITextField is not enabled for user interactions")
        XCTAssertTrue(password.isEnabled, "Password UITextField is not enabled for user interactions")
        XCTAssertTrue(repeatPassword.isEnabled, "Repeat password UITextField is not enabled for user interactions")
        XCTAssertTrue(signupButton.isEnabled, "Signup button is not enabled for user interactions")
    }
    
    func testViewController_WhenInvalidFormSubmitted_PresentsErrorAlertDialog() {
        // Arrange
        firstName.tap()
        firstName.typeText("N")
        
        lastName.tap()
        lastName.typeText("Y")
        
        mobilePhone.tap()
        mobilePhone.typeText("0")
        
        email.tap()
        email.typeText("@")
        
        password.tap()
        password.typeText("123456")
        
        repeatPassword.tap()
        repeatPassword.typeText("123")
        
        // Act
        signupButton.tap()
        
        // Assert
        XCTAssertTrue(
            app.alerts["errorAlertDialog"].waitForExistence(timeout: 1),
            "An Error Alert dialog was not presented when invalid form was submitted."
        )
        
    }
    
    func testViewController_WhenValidFormSubmitted_PresentsSuccessAlertDialog() {
        // Arrange
        firstName.tap()
        firstName.typeText("Nazmi")
        
        lastName.tap()
        lastName.typeText("Yavuz")
        
        mobilePhone.tap()
        mobilePhone.typeText("5325445544")
        
        email.tap()
        email.typeText("nazmi@mail.com")
        
        password.tap()
        password.typeText("12345678")
        
        repeatPassword.tap()
        repeatPassword.typeText("12345678")
        
        // Act
        signupButton.tap()
        
        // Assert
        XCTAssertTrue(
            app.alerts["successAlertDialog"].waitForExistence(timeout: 3),
            "An Success Alert dialog was not presented when invalid form was submitted."
        )
        
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
