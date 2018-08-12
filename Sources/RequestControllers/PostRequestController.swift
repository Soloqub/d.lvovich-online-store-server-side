//
//  PostRequestController.swift
//  PerfectTemplate
//
//  Created by Денис on 13.07.2018.
//

import Foundation
import PerfectHTTP

class PostRequestController: EncoderJSON, DecoderJSON { }

extension ProfilePostRequest {

    func register(with request: HTTPRequest, response: HTTPResponse) {
        guard let str = request.postBodyString,
            let data = str.data(using: .utf8) else {
                if let responseString = encode(response: response,
                                               withResult: .fault("Wrong user data")) {
                    
                    response.setBody(string: responseString)
                    response.completed()
                }
                return
        }
        
        let result = decodeRequest(withData: data,
                                   andType: RegisterRequest.self,
                                   andSuccessMessage: "Регистрация успешно завершена")
        guard let responseString = encode(response: response, withResult: result) else {
            return
        }
        response.setBody(string: responseString)
        response.completed()
    }

    
    func updateProfile(with request: HTTPRequest, response: HTTPResponse) {
        guard let str = request.postBodyString,
            let data = str.data(using: .utf8) else {
                if let responseString = encode(response: response,
                                               withResult: .fault("Wrong user data")) {
                    response.setBody(string: responseString)
                    response.completed()
                }
                return
        }

        let result = decodeRequest(withData: data,
                                   andType: ProfileUpdateRequest.self,
                                   andSuccessMessage: "Профиль успешно обновлён")
        guard let responseString = encode(response: response, withResult: result) else {
            return
        }
        response.setBody(string: responseString)
        response.completed()
    }
}

extension AuthPostRequest {

    func login(with request: HTTPRequest, response: HTTPResponse) {
        guard let str = request.postBodyString,
            let data = str.data(using: .utf8) else {
                if let responseString = encode(response: response, withResult: .fault("Wrong user data")) {
                    response.setBody(string: responseString)
                    response.completed()
                }
                return
        }

        let result = decodeRequest(withData: data,
                                   andType: LoginRequest.self,
                                   andSuccessMessage: "Логин успешно осуществлён")

        switch result {
        case .success(let message):
            let user = User(id: 123, login: "geekbrains", name: "John", lastname: "Doe")
            let responseEntity = LoginResponse(result: 1, message: message, user: user)
            if let responseString = encode(entity: responseEntity, response: response) {
                response.setBody(string: responseString)
                response.completed()
            }
        case .fault(let message):
            let responseEntity = SimpleResponse(result: 0, message: message)
            if let responseString = encode(entity: responseEntity, response: response) {
                response.setBody(string: responseString)
                response.completed()
            }
        }
    }
    
    func logout(with request: HTTPRequest, response: HTTPResponse) {
        guard let str = request.postBodyString,
            let data = str.data(using: .utf8) else {
                if let responseString = encode(response: response,
                                               withResult: .fault("Wrong user data")) {
                    response.setBody(string: responseString)
                    response.completed()
                }
                return
        }
        
        let result = decodeRequest(withData: data,
                                   andType: UserIDRequest.self,
                                   andSuccessMessage: "Выход успешно осуществлён")
        guard let responseString = encode(response: response, withResult: result) else {
            return
        }
        response.setBody(string: responseString)
        response.completed()
    }
}

extension ReviewPostRequest {
    func addReview(with request: HTTPRequest, response: HTTPResponse) {
        guard let str = request.postBodyString,
            let data = str.data(using: .utf8) else {
                if let responseString = encode(response: response, withResult: .fault("Wrong user data")) {
                    response.setBody(string: responseString)
                    response.completed()
                }
                return
        }
        
        let result = decodeRequest(withData: data,
                                   andType: ProductIDRequest.self,
                                   andSuccessMessage: "Обзор добавлен")
        
        switch result {
        case .success(let message):
            let review = Review(id: 12, authorName: "John Doe", text: "Ok")
            let responseEntity = ReviewResult(result: 1, message: message, review: review)
            if let responseString = encode(entity: responseEntity, response: response) {
                response.setBody(string: responseString)
                response.completed()
            }
        case .fault(let message):
            let responseEntity = SimpleResponse(result: 0, message: message)
            if let responseString = encode(entity: responseEntity, response: response) {
                response.setBody(string: responseString)
                response.completed()
            }
        }
    }
    
    func deleteReview(with request: HTTPRequest, response: HTTPResponse) {
        guard let str = request.postBodyString,
            let data = str.data(using: .utf8) else {
                if let responseString = encode(response: response,
                                               withResult: .fault("Wrong user data")) {
                    response.setBody(string: responseString)
                    response.completed()
                }
                return
        }
        
        let result = decodeRequest(withData: data,
                                   andType: DeleteReviewRequest.self,
                                   andSuccessMessage: "Обзор успешно удалён")
        guard let responseString = encode(response: response, withResult: result) else {
            return
        }
        response.setBody(string: responseString)
        response.completed()
    }
}

extension BasketPostRequest {

    func addProductToBasket(with request: HTTPRequest, response: HTTPResponse) {
        guard let str = request.postBodyString,
            let data = str.data(using: .utf8) else {
                if let responseString = encode(response: response,
                                               withResult: .fault("Wrong user data")) {
                    response.setBody(string: responseString)
                    response.completed()
                }
                return
        }

        let result = decodeRequest(withData: data,
                                   andType: AddProductToBasketRequest.self,
                                   andSuccessMessage: "Товар успешно добавлен в корзину")
        guard let responseString = encode(response: response, withResult: result) else {
            return
        }
        response.setBody(string: responseString)
        response.completed()
    }

    func deleteProductToBasket(with request: HTTPRequest, response: HTTPResponse) {
        guard let str = request.postBodyString,
            let data = str.data(using: .utf8) else {
                if let responseString = encode(response: response,
                                               withResult: .fault("Wrong user data")) {
                    response.setBody(string: responseString)
                    response.completed()
                }
                return
        }

        let result = decodeRequest(withData: data,
                                   andType: ProductIDRequest.self,
                                   andSuccessMessage: "Товар успешно удалён из корзины")
        guard let responseString = encode(response: response, withResult: result) else {
            return
        }
        response.setBody(string: responseString)
        response.completed()
    }

    func basketPay(with request: HTTPRequest, response: HTTPResponse) {
        guard let str = request.postBodyString,
            let data = str.data(using: .utf8) else {
                if let responseString = encode(response: response,
                                               withResult: .fault("Wrong user data")) {
                    response.setBody(string: responseString)
                    response.completed()
                }
                return
        }

        let result = decodeRequest(withData: data,
                                   andType: UserIDRequest.self,
                                   andSuccessMessage: "Оплата товаров в корзине успешно произведена")
        guard let responseString = encode(response: response, withResult: result) else {
            return
        }
        response.setBody(string: responseString)
        response.completed()
    }
}

typealias AuthPostRequest = PostRequestController
typealias ProfilePostRequest = PostRequestController
typealias ReviewPostRequest = PostRequestController
typealias BasketPostRequest = PostRequestController
