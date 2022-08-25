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
    
//    public static func
    
    // MARK: - AppStorage
    
    public static var userToken: String? {
        get { main.userToken }
        set { main.userToken = newValue }
    }
}
