//
//  APIClient.RoomFetch.swift
//  KaleubSDK
//
//  Created by Jaesung Lee on 2022/06/21.
//

import Foundation

extension APIClient {
    func fetchRoomList(resultHandler: @escaping (Result<[Room], Error>) -> Void) {
        let request = RoomListRequest()
        self.send(request) { result in
            switch result {
            case .success(let response):
                let rooms = response.rooms
                rooms.forEach { $0.apiClient = self }
                resultHandler(.success(rooms))
            case .failure(let error):
                resultHandler(.failure(error))
            }
        }
    }
    
    func createRoom(title: String, password: String, resultHandler: @escaping (Result<Room?, Error>) -> Void) {
        let request = RoomCreateRequest(title: title, password: password)
        self.send(request) { result in
            switch result {
            case .success(let response):
                let room = response.room
                resultHandler(.success(room))
            case .failure(let error):
                resultHandler(.failure(error))
            }
        }
    }
    
//    func createRoom(with params: Room.Params) {
//        let roomIDFromServer: String = ""
//        let newRoom = Room(from: <#Decoder#>)
//        rooms.updateValue(newRoom, forKey: roomIDFromServer)
//    }
}
