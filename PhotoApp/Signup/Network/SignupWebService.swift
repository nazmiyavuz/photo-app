//
//  SignupWebService.swift
//  PhotoApp
//
//  Created by Nazmi Yavuz on 10.04.2022.
//

import Foundation

class SignupWebService: SignupWebServiceProtocol {
    
    private var urlSession: URLSession
    private var urlString: String?
    
    init(urlString: String?, urlSession: URLSession = .shared) {
        self.urlString = urlString
        self.urlSession = urlSession
    }
    
    func signup(withForm formModel: SignupFormRequestModel, completionHandler: @escaping (SignupResponseModel?, SignupError?) -> Void) {
        
        guard let urlString = urlString else {
            completionHandler(nil, SignupError.invalidRequestURLString)
            return
        }
        
        let url = URL(fileURLWithPath: urlString)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        request.httpBody = try? JSONEncoder().encode(formModel)
        
        let dataTask = urlSession.dataTask(with: request) { data, response, error in
            let errorDescription = "A localized description of an error"
            if error != nil {
                completionHandler(
                    nil,
                    SignupError.failedRequest(description: errorDescription))
            } else if let data = data,
                let signupResponseModel = try? JSONDecoder().decode(SignupResponseModel.self, from: data) {
                completionHandler(signupResponseModel, nil)
            } else {
                completionHandler(nil, SignupError.invalidResponseModel)
            }
        }
        
        dataTask.resume()
    }
}
