//
//  DeleteReviewRequest.swift
//  PerfectTemplate
//
//  Created by Денис on 20.07.2018.
//

import Foundation

struct DeleteReviewRequest: Codable {
    
    var idProduct: Int
    var idReview: Int
    
    enum CodingKeys: String, CodingKey {
        case idProduct = "id_product"
        case idReview = "id_review"
    }
}
