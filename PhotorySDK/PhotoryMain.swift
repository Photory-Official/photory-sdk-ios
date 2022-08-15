//
//  PhotoryMain.swift
//  PhotorySDK
//
//  Created by Jaesung Lee on 2022/06/16.
//

import Foundation

class PhotoryMain {
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
    
    func signUp(email: String, password: String, nickname: String, resultHandler: @escaping (Result<Void, Error>) -> Void) {
        apiClient.signUp(email: email, password: password, nickname: nickname) { result in
            DispatchQueue.main.async {
                resultHandler(result)
            }
        }
    }
    
    // MARK: - Sign in
    func signIn(email: String, password: String, resultHandler: @escaping (Result<String, Error>) -> Void) {
        apiClient.signIn(email: email, password: password) { result in
            DispatchQueue.main.async {
                resultHandler(result)
            }
        }
    }
    
    // TODO: 로그인 유지는 어떻게? 토큰?
    func signIn(resultHandler: @escaping (Result<Void, Error>) -> Void) {
        apiClient.signIn { result in
            DispatchQueue.main.async {
                resultHandler(result)
            }
        }
    }
    
    // MARK: - Room
    
    func fetchRoomList(resultHandler: @escaping (Result<[Room], Error>) -> Void) {
        roomManager.fetchRoomList { result in
            DispatchQueue.main.async {
                resultHandler(result)
            }
        }
    }
    
    
    func createRoom(title: String, password: String, resultHandler: @escaping (Result<Room?, Error>) -> Void) {
        roomManager.createRoom(title: title, password: password) { result in
            DispatchQueue.main.async {
                resultHandler(result)
            }
        }
    }
    
    
//    // MARK: - Room List
//    func createRoomListQuery(with params: RoomListQuery.Params = .init()) -> RoomListQuery {
//        RoomListQuery(apiClient: apiClient, params: params)
//    }
//
//    // MARK: - Room
//    func createRoom(with params: Room.Params) {
////        roomManager.createRoom(with: params)
//    }
//
//    func enterRoom(id: String) {
//        guard let room = roomManager.rooms[id] else { return }
//        room.enter()
//    }
//
//    func leaveRoom(id: String) {
//        guard let room = roomManager.rooms[id] else { return }
//        room.leave()
//    }
//
//    func deleteRoom(id: String) {
//        guard let room = roomManager.rooms[id] else { return }
//        room.delete()
//    }
//
//    func changePassword(to newPassword: String, forRoomID id: String) {
//        guard let room = roomManager.rooms[id] else { return }
//        room.changePassword(to: newPassword)
//    }
}

