//
//  SignInRequest.swift
//  KaleubSDK
//
//  Created by Hamlit Jason on 2022/06/17.
//

import Foundation

struct SignInRequest: Request, Respondable {
    typealias ResponseType = SignInResponse
    let email: String
    let password: String
    
    let method: APIClient.Method = .post
    
    var key: String { "auth/login" }
    
    func urlRequst(baseURL: URL) -> URLRequest? {
        guard let url = URL(string: "\(baseURL)/\(key)") else {
            return nil
        }

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.stringValue
        return urlRequest
    }
}
