//
//  APIClientTests.swift
//  KaleubSDKTests
//
//  Created by Hamlit Jason on 2022/06/16.
//

import XCTest
@testable import KaleubSDK

class APIClientTestsSignUp: XCTestCase {
    var apiClient: APIClient?
    
    override func setUp() {
        apiClient = APIClient()
    }

    override func tearDown() {
        apiClient = APIClient()
    }

    // MARK: - SignUp
    
    func test_signUp() throws {
        let email = "heyazoo12007@gmail.com"
        let password = "12a3456"
        
        let expectation = XCTestExpectation()
        expectation.expectedFulfillmentCount = 1
        
        apiClient?.signUp(email: email, password: password) { result in
            switch result {
            case .success(let response):
                XCTAssert(response == nil)
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
        
        apiClient?.checkEmailValidation(email: "heyazoo1007@gmail.com") { result in
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
        
        apiClient?.sendVerificationMail(to: "heyazoo1007@gmail.com") { result in
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
        
        apiClient?.checkVerificationValidation(email: email, authKey: authKey) { result in
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
        
        apiClient?.checkPasswordValidation(password: password) { result in
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

        apiClient?.signIn(email: email, password: password) { result in
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

        apiClient?.signIn { result in
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
