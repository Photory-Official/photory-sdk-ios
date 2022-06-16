//
//  RoomListRequest.swift
//  KaleubSDK
//
//  Created by Hamlit Jason on 2022/06/16.
//

import Foundation

struct RoomListRequest: Request, Respondable {
    typealias ResponseType = RoomListResponse
    let email: String
    let password: String
    
    let method: APIClient.Method = .get
    
    var key: String { "room" }
    
    func urlRequst(baseURL: URL) -> URLRequest? {
        guard let url = URL(string: "\(baseURL)/\(key)") else {
            return nil
        }

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.stringValue
        urlRequest.addValue("Bearer", forHTTPHeaderField: "Authorization")
        return urlRequest
    }
}
