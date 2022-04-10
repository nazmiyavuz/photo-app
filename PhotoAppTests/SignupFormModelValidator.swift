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
        let isLastNameValid = sut.isLastNameValid(firstName: "Yavuz")
        
        // Assert
        XCTAssertTrue(isLastNameValid, "The isLastNameValid() should have return TRUE for a valid last name but returned FALSE.")
    }
    
    func testSignupFormModelValidator_WhenTooShortLastNameProvided_ShouldReturnFalse() {
        
        // Arrange
        // Act
        let isLastNameValid = sut.isLastNameValid(firstName: "Y")
        
        // Assert
        XCTAssertFalse(isLastNameValid, "The isLastNameValid() should have return FALSE for a last name is shorter than \(SignupConstants.lastNameMinLength) characters but it has returned TRUE.")
    }
    
    func testSignupFormModelValidator_WhenTooLongLastNameProvided_ShouldReturnFalse() {
        
        // Arrange
        // Act
        let isLastNameValid = sut.isLastNameValid(firstName: "NazmiYavuzIst")
        
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
    
}
