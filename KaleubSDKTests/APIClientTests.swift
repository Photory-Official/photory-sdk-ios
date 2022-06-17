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
        let request = SignUpRequest(email: "1", password: "123456")
        client.send(request) { result in
            switch result {
            case .success(let response):
                XCTAssert(response != nil)
            case .failure(let error):
                print("실패")
                XCTFail(error.localizedDescription)
            }
        }
    }
    
    // orijoon98@gmail.com - 123456
}
