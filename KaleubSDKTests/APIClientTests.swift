//
//  APIClientTests.swift
//  KaleubSDKTests
//
//  Created by Hamlit Jason on 2022/06/16.
//

import XCTest
@testable import KaleubSDK

class APIClientTests: XCTestCase {
    
    override func setUp() {
        
    }

    override func tearDown() {
        
    }

    func test_sign_up() throws {
        let request = SignUpRequest(email: "heyazoo127@gmail.com", password: "12a3456")

        let expectation = XCTestExpectation()
        expectation.expectedFulfillmentCount = 1
        
        let client = APIClient()
        client.send(request) { result in
            switch result {
            case .success(let response):
                XCTAssert(response != nil)
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 120)
    }
    
    func test_sign_in() throws {
        let request = SignInRequest(email: "heyazoo1007@gmail.com", password: "1234a56")

        let expectation = XCTestExpectation()
        expectation.expectedFulfillmentCount = 1

        let client = APIClient()
        client.send(request) { result in
            switch result {
            case .success(let response):
                print(response.stringtest)
                XCTAssert(response != nil)
            case .failure(let error):
                XCTFail(error.localizedDescription)

            }
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 120)
    }
}
