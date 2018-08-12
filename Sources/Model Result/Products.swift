//
//  Products.swift
//  PerfectTemplate
//
//  Created by Денис Львович on 17.07.2018.
//

import Foundation

struct Product: Codable {
    let id: Int
    let name: String
    let price: Int

    enum CodingKeys: String, CodingKey {
        case id = "id_product"
        case name = "product_name"
        case price
    }
}

struct ProductDetail: Codable {
    let result: Int
    let name: String
    let price: Int
    let description: String

    enum CodingKeys: String, CodingKey {
        case result
        case name = "product_name"
        case price = "product_price"
        case description = "product_description"
    }
}
