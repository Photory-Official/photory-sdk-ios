//
//  AuthKeyValidationRequest.swift
//  KaleubSDK
//
//  Created by Hamlit Jason on 2022/06/17.
//

import Foundation

struct AuthKeyValidationRequest: Request, Respondable {
    typealias ResponseType = AuthKeyValidationResponse
    let email: String
    let authKey: String
    
    let method: APIClient.Method = .post
    
    var key: String { "auth/signup/email/complete" }
    
    func urlRequst(baseURL: URL) -> URLRequest? {
        guard let url = URL(string: "\(baseURL)/\(key)") else {
            return nil
        }

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.stringValue
        
        let object = ["email": email, "authKey": authKey]
        let data = try? JSONSerialization.data(withJSONObject: object, options: [])
        urlRequest.httpBody = data
        
        return urlRequest
    }
}

