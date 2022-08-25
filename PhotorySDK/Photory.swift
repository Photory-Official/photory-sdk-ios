//
//  Photory.swift
//  PhotorySDK
//
//  Created by Jaesung Lee on 2022/06/16.
//

import Foundation

public class Photory {
    static let main = PhotoryMain()
    
    // MARK: - Auth
    
    /// SignIn - 이메일 및 패스워드
    public static func signIn(email: String, password: String, resultHandler: @escaping (Result<String, Error>) -> Void) {
        main.signIn(email: email, password: password, resultHandler: resultHandler)
    }
    
    /// SignUp
    public static func signUp(email: String, password: String, nickname: String, resultHandler: @escaping (Result<Void, Error>) -> Void) {
        main.signUp(email: email, password: password, nickname: nickname, resultHandler: resultHandler)
    }
    
    /// 이메일이 중복 확인
    public static  func sendVerificationMail(to email: String, resultHandler: @escaping (Result<Void, Error>) -> Void) {
        main.sendVerificationMail(to: email, resultHandler: resultHandler)
    }
    
    // MARK: - Room
    public static func fetchRoom(resultHandler: @escaping (Result<[Room], Error>) -> Void) {
        main.fetchRoomList(resultHandler: resultHandler)
    }
    
    public static func createRoom(title: String, password: String, resultHandler: @escaping (Result<Room?, Error>) -> Void) {
        main.createRoom(title: title, password: password, resultHandler: resultHandler)
    }
    
    
    public static func enterRoom(code: String, password: String, resultHandler: @escaping (Result<Room?, Error>) -> Void) {
        main.enterRoom(code: code, password: password, resultHandler: resultHandler)
    }
    
    public static func leaveRoom(roomId: Int64, resultHandler: @escaping (Result<Void, Error>) -> Void) {
        main.leaveRoom(roomId: roomId, resultHandler: resultHandler)
    }
    
    public static func disableRoom(roomId: Int64, resultHandler: @escaping (Result<Void, Error>) -> Void) {
        main.disableRoom(roomId: roomId, resultHandler: resultHandler)
    }
    
    public static func kickRoom(roomId: Int64, deleteUserId: Int64, resultHandler: @escaping (Result<Void, Error>) -> Void) {
        main.kickRoom(roomId: roomId, deleteUserId: deleteUserId, resultHandler: resultHandler)
    }
    
    public static func passwordRoom(roomId: Int64, beforePassword: String, afterPassword: String, resultHandler: @escaping (Result<Void, Error>) -> Void) {
        main.passwordRoom(roomId: roomId, beforePassword: beforePassword, afterPassword: afterPassword, resultHandler: resultHandler)
    }
    
    public static func changeOwnerRoom(roomId: Int64, delegatedUserId: Int64, resultHandler: @escaping (Result<Void, Error>) -> Void) {
        main.changeOwnerRoom(roomId: roomId, delegatedUserId: delegatedUserId, resultHandler: resultHandler)
    }
    
//    public static func
    
    // MARK: - AppStorage
    
    public static var userToken: String? {
        get { main.userToken }
        set { main.userToken = newValue }
    }
}
