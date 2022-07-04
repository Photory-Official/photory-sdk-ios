//
//  APIClientTests.Room.swift
//  KaleubSDKTests
//
//  Created by Hamlit Jason on 2022/06/28.
//

import XCTest
@testable import KaleubSDK

extension APIClientTests {
    func test_createRoom() {
        let expectation = XCTestExpectation()
        expectation.expectedFulfillmentCount = 1
        
        apiClient?.createRoom(title: "첫번쨰방", password: "123a456") { result in
            switch result {
            case .success(let response):
                print("✅ response \(response?.code)") // T1464V01
                XCTAssert(true)
            case .failure(let error):
                if let error = error as? APIClient.APIError {
                    XCTFail(error.localizedDescription)
                } else {
                    XCTFail(error.localizedDescription)
                }
            }
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 30)
    }

    // NOTE: - 바꾼 코드는 없는데, 어제 밤에는 실패하던 코드가 오늘 아침에 해보니까 통과함
    func test_enterRoom() {
        let expectation = XCTestExpectation()
        expectation.expectedFulfillmentCount = 1
        
        // T1464V01, 123a456
        apiClient?.enterRoom(code: "86LY0W49", password: "123a456") { result in
            switch result {
            case .success(let response):
                print("✅ response \(response?.code)") // 86LY0W49
                XCTAssert(true)
            case .failure(let error):
                if let error = error as? APIClient.APIError {
                    XCTFail(error.localizedDescription)
                } else {
                    XCTFail(error.localizedDescription)
                }
            }
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 30)
    }
    
    func test_fetchRoom() {
        let expectation = XCTestExpectation()
        expectation.expectedFulfillmentCount = 1
        
        // T1464V01, 123a456
        apiClient?.fetchRoomList { result in
            switch result {
            case .success(let response):
                response.forEach { room in
                    print("✅ room \(room.code) id \(room.id)")
                }
                
                XCTAssert(true)
            case .failure(let error):
                if let error = error as? APIClient.APIError {
                    XCTFail(error.localizedDescription)
                } else {
                    XCTFail(error.localizedDescription)
                }
            }
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 30)
    }

    func test_deleteRoom() {
        let expectation = XCTestExpectation()
        expectation.expectedFulfillmentCount = 1

        // T1464V01, 123a456
        apiClient?.leaveRoom(roomId: 1) { result in
            switch result {
            case .success:
                print("✅")
                XCTAssert(true)
            case .failure(let error):
                if let error = error as? APIClient.APIError {
                    XCTFail(error.localizedDescription)
                } else {
                    XCTFail(error.localizedDescription)
                }
            }
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 30)
    }
}
