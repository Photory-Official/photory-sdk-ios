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
        _ = try decoder.container(keyedBy: CodingKeys.self)
    }
}
