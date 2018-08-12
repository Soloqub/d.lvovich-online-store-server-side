//
//  UserIDRequest.swift
//  PerfectTemplate
//
//  Created by Денис Львович on 20.07.2018.
//

import Foundation

struct UserIDRequest: Codable {

    var id: Int

    enum CodingKeys: String, CodingKey {
        case id = "id_user"
    }
}
