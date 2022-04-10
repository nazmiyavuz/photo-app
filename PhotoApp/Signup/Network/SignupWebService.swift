//
//  SignupWebService.swift
//  PhotoApp
//
//  Created by Nazmi Yavuz on 10.04.2022.
//

import Foundation

class SignupWebService {
    
    private var urlSession: URLSession
    
    init(urlSession: URLSession = .shared) {
        self.urlSession = urlSession
    }
    
    func signup(withForm formModel: SignupFormRequestModel, completionHandler: @escaping (SignupResponseModel?, SignupErrors?) -> Void) {
        guard let urlString = Bundle.main.path(forResource: "Dummy", ofType: "json") else {
            // TODO: Create a unit test to test that a specific error message is returned is URL is nil
            return
        }
        let url = URL(fileURLWithPath: urlString)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        request.httpBody = try? JSONEncoder().encode(formModel)
        
        let dataTask = urlSession.dataTask(with: request) { data, response, error in
            // TODO: Write a new unit test to handle and error here
            
            if let data = data,
                let signupResponseModel = try? JSONDecoder().decode(SignupResponseModel.self, from: data) {
                completionHandler(signupResponseModel, nil)
            } else {
                // TODO: Create a new unit test to handle and error here
            }
        }
        
        dataTask.resume()
    }
}
