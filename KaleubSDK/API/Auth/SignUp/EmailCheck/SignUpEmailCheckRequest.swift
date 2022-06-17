//
//  SignUpEmailCheckRequest.swift
//  KaleubSDK
//
//  Created by Hamlit Jason on 2022/06/17.
//

import Foundation

struct SignUpEmailCheckRequest: Request, Respondable {
    typealias ResponseType = SignUpEmailCheckResponse
    let email: String
    
    let method: APIClient.Method = .post
    
    var key: String { "auth/signup/email/check" }
    
    func urlRequst(baseURL: URL) -> URLRequest? {
        guard let url = URL(string: "\(baseURL)/\(key)") else {
            return nil
        }

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.stringValue
        return urlRequest
    }
}
