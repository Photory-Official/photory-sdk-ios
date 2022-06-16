//
//  KaleubMain.swift
//  KaleubSDK
//
//  Created by Jaesung Lee on 2022/06/16.
//

import Foundation

class KaleubMain {
    let version: String = "1.0.0" // [NEXT_VERSION]
    let roomManager = RoomManager()
    let apiClient = APIClient()
    
    // MARK: - Sign up
    func checkEmailValidation(email: String) {
        
    }
    
    func checkPasswordValidation(password: String) {
        
    }
    
    func sendVerificationMail(to email: String) {
        
    }
    
    func checkVerificationValidation(value: String) {
        
    }
    
    func signUp(email: String, password: String, resultHandler: @escaping (Result<Void, Error>) -> Void) {
        
        let request = SignUpRequest(email: email, password: password)
        apiClient.send(request) { result in
            switch result {
            case .success(let response):
                print(response.token)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    // MARK: - Sign in
    func signIn(email: String, password: String) {
        
    }
    
    // TODO: 로그인 유지는 어떻게? 토큰?
    func signIn(token: String) {
        
    }
    
    // MARK: - Room
    func createRoom(with params: Room.Params) {
        roomManager.createRoom(with: params)
    }
    
    func enterRoom(id: String) {
        guard let room = roomManager.rooms[id] else { return }
        room.enter()
    }
    
    func leaveRoom(id: String) {
        guard let room = roomManager.rooms[id] else { return }
        room.leave()
    }
    
    func deleteRoom(id: String) {
        guard let room = roomManager.rooms[id] else { return }
        room.delete()
    }
    
    func changePassword(to newPassword: String, forRoomID id: String) {
        guard let room = roomManager.rooms[id] else { return }
        room.changePassword(to: newPassword)
    }
}

