//
//  SignupFormRequestModel.swift
//  PhotoApp
//
//  Created by Nazmi Yavuz on 10.04.2022.
//

import Foundation

struct SignupFormRequestModel: Codable {
    let firstName, lastName, phoneNumber, email, password: String
}
