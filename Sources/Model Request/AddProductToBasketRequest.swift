//
//  AddProductToBasketRequest.swift
//  PerfectTemplate
//
//  Created by Денис Львович on 21.07.2018.
//

import Foundation

struct AddProductToBasketRequest: Codable {

    var idProduct: Int
    var quantity: Int

    enum CodingKeys: String, CodingKey {
        case idProduct = "id_product"
        case quantity
    }
}
