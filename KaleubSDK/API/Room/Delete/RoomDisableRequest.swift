//
//  RoomDisableRequest.swift
//  KaleubSDK
//
//  Created by Jaesung Lee on 2022/06/21.
//

import Foundation

struct RoomDisableRequest: Request, Respondable {
    typealias ResponseType = RoomDisableResponse

    let method: APIClient.Method = .put
    
    var key: String { "room/disable" }
    
    let roomId: Int64
    
    func urlRequst(baseURL: URL) -> URLRequest? {
        guard let url = URL(string: "\(baseURL)/\(key)") else {
            return nil
        }

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.stringValue
        
        guard let data = try? JSONSerialization.data(withJSONObject: [
            "roomId": roomId
        ]) else { return nil }
        urlRequest.httpBody = data
        
        // NOTE: - UserToken을 넣어야 합니다.
        urlRequest.addValue("Bearer", forHTTPHeaderField: "Authorization")
        return urlRequest
    }
}

