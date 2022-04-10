//
//  SignupError.swift
//  PhotoApp
//
//  Created by Nazmi Yavuz on 10.04.2022.
//

import Foundation

enum SignupError: LocalizedError, Equatable {
    case invalidResponseModel
    case invalidRequestURLString
    case failedRequest(description: String)
    
    var errorDescription: String? {
        switch self {
        case .invalidResponseModel, .invalidRequestURLString: return ""
        case .failedRequest(let description):                 return description
        }
    }
}
