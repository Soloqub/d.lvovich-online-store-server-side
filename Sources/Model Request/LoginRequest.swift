//
//  LoginRequest.swift
//  PerfectTemplate
//
//  Created by Денис Львович on 18.07.2018.
//

import Foundation

struct LoginRequest: Codable {

    var login: String = ""
    var password: String = ""

    enum CodingKeys: String, CodingKey {
        case login = "username"
        case password
    }
}
