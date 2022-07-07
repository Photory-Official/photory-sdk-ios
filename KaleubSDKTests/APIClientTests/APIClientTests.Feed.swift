//
//  APIClientTests.Feed.swift
//  KaleubSDKTests
//
//  Created by Hamlit Jason on 2022/07/07.
//

import XCTest
@testable import KaleubSDK

extension APIClientTests {
    func test_createFeed() {
        let expectation = XCTestExpectation()
        expectation.expectedFulfillmentCount = 1
        
        let image: [UIImage] = []
        let roomId: Int64 = 1
        let title: String = ""
        let content: String = ""
        
        apiClient?.createFeed(image: image, roomId: roomId, title: title, content: content) { result in
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
