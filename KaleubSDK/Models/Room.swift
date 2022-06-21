//
//  Room.swift
//  KaleubSDK
//
//  Created by Jaesung Lee on 2022/06/16.
//

import Foundation

public class Room: Codable {
    public var code: Int
    public var ownerEmail: String
    public var title: String
    public var password: String
    public var participantsCount: Int
    public var createdDate: String
    public var modifiedDate: String
    
    init(
        code: Int,
        ownerEmail: String,
        title: String,
        password: String,
        participantsCount: Int,
        createdDate: String,
        modifiedDate: String,
        apiClient: APIClient
    ) {
        self.code = code
        self.ownerEmail = ownerEmail
        self.title = title
        self.password = password
        self.participantsCount = participantsCount
        self.createdDate = createdDate
        self.modifiedDate = modifiedDate
    }
    
//    let apiClient
    public enum Role {
        case host
        case pariticipant
    }
    
    public struct Params {
        
    }
    
    func enter() {
        
    }
    
    func leave() {
        
    }
    
    func delete() {
        
    }
    
    // MARK: HOST
    func changePassword(to newPassword: String) {
        
    }
    
    func kick(userID: String) {
        
    }
    
    func changeRole(to newRole: Room.Role, forUserID userID: String) {
        
    }
}
