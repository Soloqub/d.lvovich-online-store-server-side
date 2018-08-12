//
//  LoginResponse.swift
//  PerfectTemplate
//
//  Created by Денис on 18.07.2018.
//

import Foundation

struct LoginResponse: Codable {
    let result: Int
    let message: String
    let user: User
}

struct User: Codable {
    let id: Int
    let login: String
    let name: String
    let lastname: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id_user"
        case login = "user_login"
        case name = "user_name"
        case lastname = "user_lastname"
    }
}
