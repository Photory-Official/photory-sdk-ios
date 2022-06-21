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
        super.setUp()
        
        apiClient = APIClient()
    }

    override func tearDown() {
        super.tearDown()
        
        apiClient = nil
    }

    // MARK: - SignUp
    
    func test_signUp() throws {
        // statusCode: 200 - KaleubSDK.APIClient.APIError 오류 4. 디코딩 에러
        let email = "heyaeazoa07a1@gmail.com"
        let password = "12a3456"
        
        let expectation = XCTestExpectation()
        expectation.expectedFulfillmentCount = 1
        
        apiClient?.signUp(email: email, password: password) { result in
            switch result {
            case .success:
                XCTAssertTrue(true)
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
    
    func test_checkEmailValidation() {
        // statusCode: 200 - KaleubSDK.APIClient.APIError 오류 4. 디코딩 에러
        let expectation = XCTestExpectation()
        expectation.expectedFulfillmentCount = 1
        
        apiClient?.checkEmailValidation(email: "heyaeosn13@gmail.com") { result in
            switch result {
            case .success:
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
    
    func test_sendVerificationMail() {
        // statusCode: 200 - KaleubSDK.APIClient.APIError 오류 4. 디코딩 에러
        let expectation = XCTestExpectation()
        expectation.expectedFulfillmentCount = 1
        
        apiClient?.sendVerificationMail(to: "heya7@gmail.com") { result in
            switch result {
            case .success:
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
    
    func test_checkAuthKeyValidation() {
        let email: String = "heyazoo1007@gmail.com"
        let authKey: String = "643763"
        
        let expectation = XCTestExpectation()
        expectation.expectedFulfillmentCount = 1
        
        apiClient?.checkAuthKeyValidation(email: email, authKey: authKey) { result in
            switch result {
            case .success:
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
    
    func test_checkPasswordValidation() {
        let password: String = "abcde123"
        
        let expectation = XCTestExpectation()
        expectation.expectedFulfillmentCount = 1
        
        apiClient?.checkPasswordValidation(password: password) { result in
            switch result {
            case .success:
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
    
    
    // MARK: - SignIn
    
    func test_signIn() throws {
        let email = "heyazoso1007@gmail.com"
        let password = "1234a56"
        
        let expectation = XCTestExpectation()
        expectation.expectedFulfillmentCount = 1

        apiClient?.signIn(email: email, password: password) { result in
            switch result {
            case .success:
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
    
    
    
    func test_signInToken() throws {
        let request = SignInTokenRequest()

        let expectation = XCTestExpectation()
        expectation.expectedFulfillmentCount = 1

        apiClient?.signIn { result in
            switch result {
            case .success:
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
