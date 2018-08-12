//
//  Reviews.swift
//  PerfectTemplate
//
//  Created by Денис on 20.07.2018.
//

import Foundation

struct ReviewResult: Codable {
    let result: Int
    let message: String
    let review: Review
}

struct Review: Codable {
    let id: Int
    let authorName: String
    let text: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case authorName = "author_name"
        case text
    }
}
