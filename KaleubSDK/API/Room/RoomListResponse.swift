//
//  RoomListResponse.swift
//  KaleubSDK
//
//  Created by Hamlit Jason on 2022/06/16.
//

import Foundation

struct RoomListResponse: Response, Decodable {
    let status: Int
    let message: String
    
    let rooms: [Room]
    
    typealias RequestType = RoomListRequest
    
    enum CodingKeys: String, CodingKey {
        case status
        case message
        case data
        
        enum DataKeys: String, CodingKey {
            case id
            case code
            case ownerEmail
            case title
            case password
            case participantsCount
            case createdDate
            case modifiedDate
        }
        
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        // TODO: 공통은 Response 로 옮기기
        status = try container.decode(Int.self, forKey: .status)
        message = try container.decode(String.self, forKey: .message)
//        let nestedContainer = try container.nestedContainer(keyedBy: CodingKeys.DataKeys.self, forKey: .data)
        rooms = try container.decode([Room].self, forKey: .data)
    }
}
