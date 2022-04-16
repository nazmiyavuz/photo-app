//
//  ControllersNavigationTests.swift
//  PhotoAppTests
//
//  Created by Nazmi Yavuz on 16.04.2022.
//  Copyright © 2022 Nazmi Yavuz. All rights reserved.
//

import XCTest
@testable import PhotoApp

class ControllersNavigationTests: XCTestCase {
    
    var sut: SignupViewController!
    var navigationController: UINavigationController!

    override func setUpWithError() throws {
        // Step 1. Create an instance of Storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        // Step 2. Instantiate UIViewController with Storyboard ID
        sut = storyboard.instantiateViewController(
            identifier: "SignupViewController") as? SignupViewController
        
        // Step 3. Make the viewDidLoad() execute.
        sut.loadViewIfNeeded()
        navigationController = UINavigationController(rootViewController: sut)
    }

    override func tearDownWithError() throws {
        sut = nil
        navigationController = nil
    }

    func testSignupButton_WhenTapped_FirstViewControllerIsPushed() {
        
        let myPredicate = NSPredicate { input, _ in
            return (input as? UINavigationController)?.topViewController is FirstViewController
        }
        
        expectation(for: myPredicate, evaluatedWith: navigationController)
        
        sut.signupButton.sendActions(for: .touchUpInside)
        
        waitForExpectations(timeout: 2)
        
    }
    
    func testSignupButton_WhenTapped_FirstViewControllerIsPushed_V2() {
        sut.signupButton.sendActions(for: .touchUpInside)
        RunLoop.current.run(until: Date())
        guard let _ = navigationController.topViewController as? FirstViewController else {
            XCTFail()
            return
        }
    }
    
    func testSignupButton_WhenTapped_FirstViewControllerIsPushed_V3() {
        
        let spyNavigationController = SpyNavigationController(rootViewController: sut)
        
        sut.signupButton.sendActions(for: .touchUpInside)
        
        guard let _ = spyNavigationController.pushedViewControler as? FirstViewController else {
            XCTFail()
            return
        }
        
    }

}
