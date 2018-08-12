//
//  ProductIDRequest.swift
//  PerfectTemplate
//
//  Created by Денис on 20.07.2018.
//

import Foundation

struct ProductIDRequest: Codable {
    
    var idProduct: Int
    
    enum CodingKeys: String, CodingKey {
        case idProduct = "id_product"
    }
}
