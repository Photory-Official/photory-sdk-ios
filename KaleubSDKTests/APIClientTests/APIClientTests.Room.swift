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
                print("✅ response?.id \(response?.id)")
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
        
//        wait(for: [expectation], timeout: 30)
    }

}
