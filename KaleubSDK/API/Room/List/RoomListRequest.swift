//
//  RoomListRequest.swift
//  KaleubSDK
//
//  Created by Hamlit Jason on 2022/06/16.
//

import Foundation

struct RoomListRequest: Request, Respondable {
    typealias ResponseType = RoomListResponse
    let userToken = AppStorageManager.token ?? ""
    
    let method: APIClient.Method = .get
    
    var key: String { "room" }
    
    func urlRequst(baseURL: URL) -> URLRequest? {
        guard let url = URL(string: "\(baseURL)/\(key)") else {
            return nil
        }

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.stringValue
        // NOTE: - UserToken을 넣어야 합니다.
        urlRequest.addValue("Bearer \(userToken)", forHTTPHeaderField: "Authorization")
        return urlRequest
    }
}
