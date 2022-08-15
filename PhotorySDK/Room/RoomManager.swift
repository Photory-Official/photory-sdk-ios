//
//  RoomManager.swift
//  KaleubSDK
//
//  Created by Hamlit Jason on 2022/08/15.
//

import Foundation

class RoomManager {
    let apiClient = APIClient()
    var rooms: [String: Room] = [:]
    
    
    func createRoom(title: String, password: String, resultHandler: @escaping (Result<Room?, Error>) -> Void) {
        let request = RoomCreateRequest(title: title, password: password)
        apiClient.send(request) { result in
            switch result {
            case .success(let response):
                let room = response.room
                resultHandler(.success(room))
            case .failure(let error):
                resultHandler(.failure(error))
            }
        }
    }
    
    func fetchRoomList(resultHandler: @escaping (Result<[Room], Error>) -> Void) {
        let request = RoomListRequest()
        apiClient.send(request) { result in
            switch result {
            case .success(let response):
                let rooms = response.rooms
                resultHandler(.success(rooms))
            case .failure(let error):
                resultHandler(.failure(error))
            }
        }
    }
    
}
