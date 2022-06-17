//
//  APIClientTests.swift
//  KaleubSDKTests
//
//  Created by Hamlit Jason on 2022/06/16.
//

import XCTest
@testable import KaleubSDK

class APIClientTests: XCTestCase {
    let client = APIClient()
    
    override func setUp() {
        
    }

    override func tearDown() {
        
    }

    // MARK: - SignUp
    
    func test_sign_up() throws {
        let email = "heyazoo127@gmail.com"
        let password = "12a3456"
        
        let expectation = XCTestExpectation()
        expectation.expectedFulfillmentCount = 1
        
        client.signUp(email: email, password: password) { result in
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
    
    func test_signup_email_check() {
        let expectation = XCTestExpectation()
        expectation.expectedFulfillmentCount = 1
        
        client.checkEmailValidation(email: "heyazoo1007@gmail.com") { result in
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
    
    // MARK: - SignIn
    
    func test_signin() throws {
        let email = "heyazoo1007@gmail.com"
        let password = "1234a56"
        
        let expectation = XCTestExpectation()
        expectation.expectedFulfillmentCount = 1

        let client = APIClient()
        client.signIn(email: email, password: password) { result in
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
    
    
    
    func test_signin_token() throws {
        let request = SignInTokenRequest()

        let expectation = XCTestExpectation()
        expectation.expectedFulfillmentCount = 1

        let client = APIClient()
        client.signIn { result in
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
    
}
