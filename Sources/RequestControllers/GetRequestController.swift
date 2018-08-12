//
//  GetRequestController.swift
//  PerfectTemplate
//
//  Created by Денис Львович on 17.07.2018.
//

import Foundation
import PerfectHTTP

class GetRequestController: EncoderJSON {

    func productsList(with request: HTTPRequest, response: HTTPResponse) {

        let products = [
            Product(id: 123, name: "Ноутбук", price: 45600),
            Product(id: 456, name: "Мышка", price: 1000)
        ]

        guard let responseString = encode(entities: products, response: response) else {
            response.completed(status: HTTPResponseStatus.custom(code: 500,
                                                                 message: "Couldn't encode response"))
            return
        }

        response.setBody(string: responseString)
        response.completed()
    }


    func productDetailByID(with request: HTTPRequest, response: HTTPResponse) {
        guard let id = request.param(name: "id_user") else {
            if let responseString = encode(response: response,
                                           withResult: .fault("Wrong parameters")) {
                
                response.setBody(string: responseString)
                response.completed()
            }
            return
        }
        print("id = ", id)
        
        let product = ProductDetail(result: 1, name: "Ноутбук", price: 45600, description: "Мощный игровой ноутбук")

        guard let responseString = encode(entity: product, response: response) else {
            response.completed(status: HTTPResponseStatus.custom(code: 500,
                                                                 message: "Couldn't encode response"))
            return
        }

        response.setBody(string: responseString)
        response.completed()
    }
    
    func reviewsList(with request: HTTPRequest, response: HTTPResponse) {
        guard let id = request.param(name: "id_product") else {
            if let responseString = encode(response: response,
                                           withResult: .fault("Wrong parameters")) {
                
                response.setBody(string: responseString)
                response.completed()
            }
            return
        }
        print("id = ", id)
        
        let reviews = [
            Review(id: 1, authorName: "John Doe", text: "Everything all right"),
            Review(id: 2, authorName: "Barack Obama", text: "Nothing to it")
        ]
        
        guard let responseString = encode(entities: reviews, response: response) else {
            response.completed(status: HTTPResponseStatus.custom(code: 500,
                                                                 message: "Couldn't encode response"))
            return
        }
        
        response.setBody(string: responseString)
        response.completed()
    }
}
