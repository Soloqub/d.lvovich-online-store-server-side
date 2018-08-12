//
//  Codable Protocols.swift
//  PerfectTemplate
//
//  Created by Денис Львович on 15.07.2018.
//

import Foundation
import PerfectHTTP

protocol EncoderJSON {}

extension EncoderJSON {
    /// Собирает response json и показывает ошибку 500 в случае неудачи
    func encode(response: HTTPResponse, withResult res: RequestResult) -> String? {
        let encoder = JSONEncoder()

        let responseJSON: SimpleResponse
        switch res {
        case .success(let successMessage):
            responseJSON = SimpleResponse(result: 1, message: successMessage)
        case .fault(let errorText):
            responseJSON = SimpleResponse(result: 0, message: errorText)
        }

        do {
            let jsonData = try encoder.encode(responseJSON)
            if let jsonString = String(data: jsonData, encoding: String.Encoding.utf8) {
                return jsonString
            } else {
                response.completed(status: HTTPResponseStatus.custom(code: 500,
                                                                     message: "Couldn't convert response to String"))
            }
        } catch {
            response.completed(status: HTTPResponseStatus.custom(code: 500,
                                                                 message: "Couldn't encode response - \(error)"))
        }

        return nil
    }

    func encode<T>(entities: [T], response: HTTPResponse) -> String? where T: Codable {
        let encoder = JSONEncoder()

        do {
            let jsonData = try encoder.encode(entities)
            if let jsonString = String(data: jsonData, encoding: String.Encoding.utf8) {
                return jsonString
            } else {
                response.completed(status: HTTPResponseStatus.custom(code: 500,
                                                                     message: "Couldn't convert response to String"))
            }
        } catch {
            response.completed(status: HTTPResponseStatus.custom(code: 500,
                                                                 message: "Couldn't encode response - \(error)"))
        }

        return nil
    }

    func encode<T>(entity: T, response: HTTPResponse) -> String? where T: Encodable {
        let encoder = JSONEncoder()

        do {
            let jsonData = try encoder.encode(entity)
            if let jsonString = String(data: jsonData, encoding: String.Encoding.utf8) {
                return jsonString
            } else {
                response.completed(status: HTTPResponseStatus.custom(code: 500,
                                                                     message: "Couldn't convert response to String"))
            }
        } catch {
            response.completed(status: HTTPResponseStatus.custom(code: 500,
                                                                 message: "Couldn't encode response - \(error)"))
        }

        return nil
    }
}

protocol DecoderJSON {}

extension DecoderJSON {
    /// Декодирует json из запроса
    func decodeRequest<T>(withData data: Data,
                          andType type: T.Type,
                          andSuccessMessage message: String) -> RequestResult where T: Codable {
        
        let decoder = JSONDecoder()
        do {
            let regData = try decoder.decode(T.self, from: data)
            print(regData)
            return .success(message)
        } catch {
            return .fault("Couldn't decode request")
        }
    }
}
