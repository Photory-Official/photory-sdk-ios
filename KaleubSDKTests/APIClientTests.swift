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
    
    func test_signUp() throws {
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
    
    func test_checkEmailValidation() {
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
    
    func test_sendVerificationMail() {
        let expectation = XCTestExpectation()
        expectation.expectedFulfillmentCount = 1
        
        client.sendVerificationMail(to: "heyazoo1007@gmail.com") { result in
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
    
    func test_checkVerificationValidation() {
        let email: String = "heyazoo1007@gmail.com"
        let authKey: String = "643763"
        
        let expectation = XCTestExpectation()
        expectation.expectedFulfillmentCount = 1
        
        client.checkVerificationValidation(email: email, authKey: authKey) { result in
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
    
    func test_checkPasswordValidation() {
        let password: String = "abcde123"
        
        let expectation = XCTestExpectation()
        expectation.expectedFulfillmentCount = 1
        
        client.checkPasswordValidation(password: password) { result in
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
    
    func test_signIn() throws {
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
    
    
    
    func test_signIn_token() throws {
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
