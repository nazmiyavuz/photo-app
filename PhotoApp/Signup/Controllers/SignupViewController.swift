//
//  SignupViewController.swift
//  PhotoApp
//
//  Created by Nazmi Yavuz on 12.04.2022.
//  Copyright © 2022 Nazmi Yavuz. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var mobilePhoneTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var repeatPasswordTextField: UITextField!
    
    @IBOutlet weak var signupButton: UIButton!
    
    var signupPresenter: SignupPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if signupPresenter == nil {
            let signupModelValidator = SignupFormModelValidator()
            let webService = SignupWebService(urlString: "")
            
            signupPresenter = SignupPresenter(
                formModelValidator: signupModelValidator,
                webService: webService,
                delegate: self)
        }
    }
    
    @IBAction func signupButtonPressed(_ sender: UIButton) {
        let signupFormModel = SignupFormModel(
            firstName: firstNameTextField.text ?? "",
            lastName: lastNameTextField.text ?? "",
            phoneNumber: mobilePhoneTextField.text ?? "",
            email: emailTextField.text ?? "",
            password: passwordTextField.text ?? "",
            repeatPassword: repeatPasswordTextField.text ?? "" )
        
        signupPresenter?.processUserSignup(formModel: signupFormModel)
        
//        let storyboard = UIStoryboard(name: "Home", bundle: nil)
//        let firstVC = storyboard.instantiateViewController(
//            identifier: "FirstViewController") as! FirstViewController
//        self.navigationController?.pushViewController(firstVC, animated: true)
        
    }
    
}

extension SignupViewController: SignupViewDelegateProtocol {
    func successfulSignup() {
        
        let alert = UIAlertController(
            title: "Success", message: "the signup operation was successful",
            preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        
        DispatchQueue.main.async {
            alert.view.accessibilityIdentifier = "successAlertDialog"
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func errorHandler(error: SignupError) {
        let alert = UIAlertController(
            title: "Error", message: "Your request could not be processed at this time",
            preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        DispatchQueue.main.async {
            alert.view.accessibilityIdentifier = "errorAlertDialog"
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    
}
