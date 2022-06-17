//
//  SignInResponse.swift
//  KaleubSDK
//
//  Created by Hamlit Jason on 2022/06/17.
//

import Foundation

struct SignInResponse: Response, Decodable {
    typealias RequestType = SignInRequest
    
    let user: User
    
    enum CodingKeys: String, CodingKey {
        case status
        case message
        case data
        
        enum DataKeys: String, CodingKey {
            case token
        }
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
//        let nestedContainer = try container.nestedContainer(keyedBy: CodingKeys.DataKeys.self, forKey: .data)
        user = try container.decode(User.self, forKey: .data)
    }
}
