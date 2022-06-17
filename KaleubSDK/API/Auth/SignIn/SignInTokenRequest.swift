//
//  SignInTokenRequest.swift
//  KaleubSDK
//
//  Created by Hamlit Jason on 2022/06/17.
//

import Foundation

struct SignInTokenRequest: Request, Respondable {
    typealias ResponseType = SignInResponse
    // NOTE: - KaleubMain과 충돌을 방지하고자 우선 인스턴스를 직접 생성하여 사용합니다. 추후에 변경하세요.
    let userToken = AppStorageManager().userToken ?? ""
    
    let method: APIClient.Method = .get
    
    var key: String { "auth" }
    
    func urlRequst(baseURL: URL) -> URLRequest? {
        guard let url = URL(string: "\(baseURL)/\(key)") else {
            return nil
        }

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.stringValue
        urlRequest.addValue(
            userToken,
            forHTTPHeaderField: "Bearer"
        )
        return urlRequest
    }
}
