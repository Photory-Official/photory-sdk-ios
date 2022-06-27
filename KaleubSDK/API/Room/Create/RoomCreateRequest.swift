//
//  RoomCreateRequest.swift
//  KaleubSDK
//
//  Created by Jaesung Lee on 2022/06/21.
//

import Foundation

struct RoomCreateRequest: Request, Respondable {
    typealias ResponseType = RoomCreateResponse
    let token = AppStorageManager.userToken ?? ""
    
    let method: APIClient.Method = .post
    
    var key: String { "room" }
    
    let title: String
    let password: String
    
    func urlRequst(baseURL: URL) -> URLRequest? {
        guard let url = URL(string: "\(baseURL)/\(key)") else {
            return nil
        }

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.stringValue
        
        guard let data = try? JSONSerialization.data(withJSONObject: [
            "title": title,
            "password": password
        ]) else { return nil }
        urlRequest.httpBody = data
        
        // NOTE: - UserToken을 넣어야 합니다.
        urlRequest.addValue(
            "Bearer \(token)",
            forHTTPHeaderField: "Authorization"
        )
        return urlRequest
    }
}
