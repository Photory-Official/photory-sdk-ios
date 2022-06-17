//
//  APIClientTests.swift
//  KaleubSDKTests
//
//  Created by Hamlit Jason on 2022/06/16.
//

import XCTest
@testable import KaleubSDK

class APIClientTests: XCTestCase {

    var client = APIClient()
    
    override func setUp() {
        
    }

    override func tearDown() {
        
    }

    func test_sign_up() throws {
        let client = APIClient()
        // request object
        let expectation = XCTestExpectation()
        expectation.expectedFulfillmentCount = 1
        
        let request = SignUpRequest(email: "이메일", password: "비밀번호")
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
    
    // orijoon98@gmail.com - 123456
}
