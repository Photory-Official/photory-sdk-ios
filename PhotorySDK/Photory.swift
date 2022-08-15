//
//  Photory.swift
//  PhotorySDK
//
//  Created by Jaesung Lee on 2022/06/16.
//

import Foundation

public class Photory {
    static let main = PhotoryMain()
    
    public static func fetchRoom(resultHandler: @escaping (Result<[Room], Error>) -> Void) {
        main.fetchRoomList(resultHandler: resultHandler)
    }
    
    public static func createRoom(title: String, password: String, resultHandler: @escaping (Result<Room?, Error>) -> Void) {
        main.createRoom(title: title, password: password, resultHandler: resultHandler)
    }
    
    // MARK: - AppStorage
    
    public static var userToken: String? {
        get { main.userToken }
        set { main.userToken = newValue }
    }
}
