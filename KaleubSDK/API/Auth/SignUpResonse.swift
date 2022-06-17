//
//  SignUpResonse.swift
//  KaleubSDK
//
//  Created by Hamlit Jason on 2022/06/16.
//

import Foundation

struct SignUpResponse: Response, Decodable {
    typealias RequestType = SignUpRequest
    
    enum CodingKeys: String, CodingKey {
        case status
        case message
        case data
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
//        let nestedContainer = try container.nestedContainer(keyedBy: CodingKeys.DataKeys.self, forKey: .data)
    }
}
