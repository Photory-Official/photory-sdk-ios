//
//  KaleubMain.swift
//  KaleubSDK
//
//  Created by Jaesung Lee on 2022/06/16.
//

import Foundation

class KaleubMain {
    let version: String = "1.0.0" // [NEXT_VERSION]
    let roomManager: RoomManager
    let apiClient: APIClient
    
    init() {
        self.apiClient = APIClient()
        self.roomManager = RoomManager()
    }
    
    // MARK: - Sign up
    func checkEmailValidation(email: String, resultHandler: @escaping (Result<Void, Error>) -> Void) {
        apiClient.checkEmailValidation(email: email) { result in
            DispatchQueue.main.async {
                resultHandler(result)
            }
        }
    }
    
    func checkPasswordValidation(password: String, resultHandler: @escaping (Result<Void, Error>) -> Void) {
        apiClient.checkPasswordValidation(password: password) { result in
            DispatchQueue.main.async {
                resultHandler(result)
            }
        }
    }
    
    func sendVerificationMail(to email: String, resultHandler: @escaping (Result<Void, Error>) -> Void) {
        apiClient.sendVerificationMail(to: email) { result in
            DispatchQueue.main.async {
                resultHandler(result)
            }
        }
    }
    
    func checkAuthKeyValidation(email: String, authKey: String, resultHandler: @escaping (Result<Void, Error>) -> Void) {
        apiClient.checkAuthKeyValidation(email: email, authKey: authKey) { result in
            DispatchQueue.main.async {
                resultHandler(result)
            }
        }
    }
    
    func signUp(email: String, password: String, resultHandler: @escaping (Result<Void, Error>) -> Void) {
        apiClient.signUp(email: email, password: password) { result in
            DispatchQueue.main.async {
                resultHandler(result)
            }
        }
    }
    
    // MARK: - Sign in
    func signIn(email: String, password: String, resultHandler: @escaping (Result<Void, Error>) -> Void) {
        apiClient.signIn(email: email, password: password) { result in
            DispatchQueue.main.async {
                resultHandler(result)
            }
        }
    }
    
    // TODO: 로그인 유지는 어떻게? 토큰?
    func signIn(with token: String) {
        // 앱 로컬 기기에서 불러오기 때문에 파라미터가 필요 없습니다.
        // 함수명은 signInToken으로 변경하는 건 어떨까요?
    }
    
    // MARK: - Room List
    func createRoomListQuery(with params: RoomListQuery.Params = .init()) -> RoomListQuery {
        RoomListQuery(apiClient: apiClient, params: params)
    }
    
    // MARK: - Room
    func createRoom(with params: Room.Params) {
//        roomManager.createRoom(with: params)
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

