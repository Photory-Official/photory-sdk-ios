//
//  Room.swift
//  KaleubSDK
//
//  Created by Jaesung Lee on 2022/06/16.
//

import Foundation

public class Room {
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
