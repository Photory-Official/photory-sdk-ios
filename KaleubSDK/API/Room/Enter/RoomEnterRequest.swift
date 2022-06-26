//
//  RoomEnterRequest.swift
//  KaleubSDK
//
//  Created by Jaesung Lee on 2022/06/21.
//

import Foundation

struct RoomEnterRequest: Request, Respondable {
    typealias ResponseType = RoomEnterResponse

    let method: APIClient.Method = .post
    
    var key: String { "room/participant" }
    
    let code: String
    let password: String
    
    func urlRequst(baseURL: URL) -> URLRequest? {
        guard let url = URL(string: "\(baseURL)/\(key)") else {
            return nil
        }

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.stringValue
        
        guard let data = try? JSONSerialization.data(withJSONObject: [
            "code": code,
            "password": password
        ]) else { return nil }
        urlRequest.httpBody = data
        
        // NOTE: - UserToken을 넣어야 합니다.
        urlRequest.addValue("Bearer", forHTTPHeaderField: "Authorization")
        return urlRequest
    }
}
