//
//  SignupFormRequestModel.swift
//  PhotoApp
//
//  Created by Nazmi Yavuz on 10.04.2022.
//

import Foundation

struct SignupFormRequestModel: Encodable {
    let firstName, lastName, email, password: String
}
