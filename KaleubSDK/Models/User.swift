//
//  User.swift
//  KaleubSDK
//
//  Created by Hamlit Jason on 2022/06/16.
//

import Foundation

public class User: Codable {
    public var token: String
    
    public init(token: String) {
        self.token = token
    }
}
