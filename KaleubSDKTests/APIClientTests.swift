//
//  APIClientTests.swift
//  KaleubSDKTests
//
//  Created by Hamlit Jason on 2022/06/16.
//

import XCTest
@testable import KaleubSDK

class APIClientTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        let client = APIClient()
        // request object
        let request = SignUpRequest(email: "1", password: "123456")
        client.send(request) { result in
            switch result {
            case .success(let response):
                XCTAssert(response.token != nil)
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
    }
}
