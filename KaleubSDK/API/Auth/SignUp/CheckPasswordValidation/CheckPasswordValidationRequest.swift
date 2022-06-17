//
//  CheckPasswordValidationRequest.swift
//  KaleubSDK
//
//  Created by Hamlit Jason on 2022/06/17.
//

import Foundation

struct CheckPasswordValidationRequest: Request, Respondable {
    typealias ResponseType = CheckPasswordValidationReqsponse
    let password: String
    
    let method: APIClient.Method = .post
    
    var key: String { "auth/signup/password/check" }
    
    func urlRequst(baseURL: URL) -> URLRequest? {
        guard let url = URL(string: "\(baseURL)/\(key)") else {
            return nil
        }

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.stringValue
        return urlRequest
    }
}


