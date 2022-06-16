//
//  RoomListResponse.swift
//  KaleubSDK
//
//  Created by Hamlit Jason on 2022/06/16.
//

import Foundation

struct RoomListResponse: Response, Decodable {
    let token: User
    
    typealias RequestType = RoomListRequest
    
    enum CodingKeys: String, CodingKey {
        case status
        case message
        case data
        
        enum DataKeys: String, CodingKey {
            case id
            case code
        }
        
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let nestedContainer = container.nestedContainer(keyedBy: CodingKeys.DataKeys.self, forKey: .data)
        id = nestedContainer.decode(Int.self, forKey: .id)
    }
}
