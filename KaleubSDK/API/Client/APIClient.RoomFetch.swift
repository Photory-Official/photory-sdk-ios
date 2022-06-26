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
}
