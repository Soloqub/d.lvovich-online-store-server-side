//
//  ProfileUpdateRequest.swift
//  PerfectTemplate
//
//  Created by Денис Львович on 17.07.2018.
//

import Foundation

struct ProfileUpdateRequest: Codable {

    var id: Int = 0
    var login: String = ""
    var password: String = ""
    var email: String = ""
    var gender: String = ""
    var creditCard: String = ""
    var bio: String = ""

    enum CodingKeys: String, CodingKey {
        case id = "id_user"
        case login = "username"
        case password
        case email
        case gender
        case creditCard = "credit_card"
        case bio
    }
}
