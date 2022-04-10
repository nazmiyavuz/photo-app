//
//  SignupWebServiceTests.swift
//  PhotoAppTests
//
//  Created by Nazmi Yavuz on 10.04.2022.
//

import XCTest
@testable import PhotoApp

class SignupWebServiceTests: XCTestCase {

    override func setUp() {
        //
    }
    
    override class func tearDown() {
        //
    }
    
    func testSignupWebService_WhenGivenSuccessfulResponse_ReturnsSuccess() {
        
        // Arrange
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocol.self]
        let urlSession = URLSession(configuration: config)
        let jsonString = "{\"status\":\"ok\"}"
        MockURLProtocol.stubResponseData = jsonString.data(using: .utf8)
        
        let sut = SignupWebService(urlSession: urlSession)
        
        let signFormRequestModel = SignupFormRequestModel(firstName: "Nazmi",
                                                          lastName: "Yavuz",
                                                          email: "nazmi@mail.com",
                                                          password: "12345678")
        
        let expectation = self.expectation(description: "Signup Web Service Response Expectation")
        // Act
        sut.signup(withForm: signFormRequestModel) { (signupResponseModel, error) in
            
            // Assert
            //"{\"status\":\"ok\"}"
            XCTAssertEqual(signupResponseModel?.status, "ok")
            expectation.fulfill()
        }
        
        self.wait(for: [expectation], timeout: 5)
        
    }

}
