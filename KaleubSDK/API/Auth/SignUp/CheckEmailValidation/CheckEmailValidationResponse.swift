//
//  SignUpEmailCheckResponse.swift
//  KaleubSDK
//
//  Created by Hamlit Jason on 2022/06/17.
//

import Foundation

struct CheckEmailValidationResponse: Response, Decodable {
    typealias RequestType = CheckEmailValidationRequest
    
    enum CodingKeys: String, CodingKey {
        case status
        case message
        case data
    }
    
    init(from decoder: Decoder) throws {
        _ = try decoder.container(keyedBy: CodingKeys.self)
    }
}
