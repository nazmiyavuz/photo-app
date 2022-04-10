//
//  SignupFormModelValidator.swift
//  PhotoAppTests
//
//  Created by Nazmi Yavuz on 10.04.2022.
//

import XCTest
@testable import PhotoApp

class SignupFormModelValidatorTests: XCTestCase {
    
    private var sut: SignupFormModelValidator!
    
    override func setUp() {
        sut = SignupFormModelValidator()
    }
    
    override func tearDown() {
        sut = nil
    }
    
    // MARK: - First Name

    func testSignupFormModelValidator_WhenValidFirstNameProvided_ShouldReturnTrue() {
        
        // Arrange
        // Act
        let isFirstNameValid = sut.isFirstNameValid(firstName: "Nazmi")
        
        // Assert
        XCTAssertTrue(isFirstNameValid, "The isFirstNameValid() should have return TRUE for a valid first name but returned FALSE.")
    }
    
    func testSignupFormModelValidator_WhenTooShortFirstNameProvided_ShouldReturnFalse() {
        
        // Arrange
        // Act
        let isFirstNameValid = sut.isFirstNameValid(firstName: "N")
        
        // Assert
        XCTAssertFalse(isFirstNameValid, "The isFirstNameValid() should have return FALSE for a first name is shorter than \(SignupConstants.firstNameMinLength) characters but it has returned TRUE.")
    }
    
    func testSignupFormModelValidator_WhenTooLongFirstNameProvided_ShouldReturnFalse() {
        
        // Arrange
        // Act
        let isFirstNameValid = sut.isFirstNameValid(firstName: "NazmiYavuzIst")
        
        // Assert
        XCTAssertFalse(isFirstNameValid, "The isFirstNameValid() should have return FALSE for a first name is longer than \(SignupConstants.firstNameMaxLength) characters but it has returned TRUE.")
    }
    
    // MARK: - Last Name
    
    func testSignupFormModelValidator_WhenValidLastNameProvided_ShouldReturnTrue() {
        
        // Arrange
        // Act
        let isLastNameValid = sut.isLastNameValid(lastName: "Yavuz")
        
        // Assert
        XCTAssertTrue(isLastNameValid, "The isLastNameValid() should have return TRUE for a valid last name but returned FALSE.")
    }
    
    func testSignupFormModelValidator_WhenTooShortLastNameProvided_ShouldReturnFalse() {
        
        // Arrange
        // Act
        let isLastNameValid = sut.isLastNameValid(lastName: "Y")
        
        // Assert
        XCTAssertFalse(isLastNameValid, "The isLastNameValid() should have return FALSE for a last name is shorter than \(SignupConstants.lastNameMinLength) characters but it has returned TRUE.")
    }
    
    func testSignupFormModelValidator_WhenTooLongLastNameProvided_ShouldReturnFalse() {
        
        // Arrange
        // Act
        let isLastNameValid = sut.isLastNameValid(lastName: "NazmiYavuzIst")
        
        // Assert
        XCTAssertFalse(isLastNameValid, "The isLastNameValid() should have return FALSE for a last name is longer than \(SignupConstants.lastNameMaxLength) characters but it has returned TRUE.")
    }
    
    // MARK: - Email
    
    func testSignupFormModelValidator_WhenValidEmailProvided_ShouldReturnTrue() {
        
        // Arrange
        // Act
        let isValidEmailFormat = sut.isValidEmailFormat(email: "nazmi@mail.com")
        
        // Assert
        XCTAssertTrue(isValidEmailFormat, "The isValidEmailFormat() should have return TRUE for a valid email but returned FALSE.")
    }
    
    // MARK: - Password
    
    func testSignupFormModelValidator_WhenValidPasswordProvided_ShouldReturnTrue() {
        
        // Arrange
        // Act
        let isPasswordValid = sut.isPasswordValid(password: "12345678")
        
        // Assert
        XCTAssertTrue(isPasswordValid, "The isPasswordValid() should have return TRUE for a valid password but returned FALSE.")
    }
    
    func testSignupFormModelValidator_WhenTooShortPasswordProvided_ShouldReturnFalse() {
        
        // Arrange
        // Act
        let isPasswordValid = sut.isPasswordValid(password: "123456")
        
        // Assert
        XCTAssertFalse(isPasswordValid, "The isLastNameValid() should have return FALSE for a password is shorter than \(SignupConstants.passwordMinLength) characters but it has returned TRUE.")
    }
    
    func testSignupFormModelValidator_WhenTooLongPasswordProvided_ShouldReturnFalse() {
        
        // Arrange
        // Act
        let isPasswordValid = sut.isPasswordValid(password: "12345678901234567")
        
        // Assert
        XCTAssertFalse(isPasswordValid, "The isLastNameValid() should have return FALSE for a password is longer than \(SignupConstants.passwordMaxLength) characters but it has returned TRUE.")
    }
    
    func testSignupFormModelValidator_WhenEqualPasswordsProvided_ShouldReturnTrue() {
        // Act
        let doPasswordsMatch = sut.doPasswordsMatch(password: "12345678",
                                                    repeatPassword: "12345678")
        
        // Assert
        XCTAssertTrue(doPasswordsMatch, "The doPasswordsMatch() should have return TRUE for matching passwords but returned FALSE.")
    }
    
    func testSignupFormModelValidator_WhenNotMatchingPasswordsProvided_ShouldReturnFalse() {
        // Act
        let doPasswordsMatch = sut.doPasswordsMatch(password: "12345678",
                                                    repeatPassword: "1234567")
        
        // Assert
        XCTAssertFalse(doPasswordsMatch, "The doPasswordsMatch() should have return FALSE for matching passwords but returned TRUE.")
    }
}
