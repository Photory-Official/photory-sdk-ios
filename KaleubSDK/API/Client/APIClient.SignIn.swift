//
//  APIClient.SignIn.swift
//  KaleubSDK
//
//  Created by Hamlit Jason on 2022/06/17.
//

import Foundation

// MARK: - SignIn
extension APIClient {
    // MARK: - signIn
    
    func signIn(email: String, password: String, resultHandler: @escaping (Result<Void, Error>) -> Void) {
        let request = SignInRequest(email: email, password: password)
        self.send(request) { result in
            switch result {
            case .success(let response):
                print(response)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func signIn(resultHandler: @escaping (Result<Void, Error>) -> Void) {
        let request = SignInTokenRequest()
        self.send(request) { result in
            switch result {
            case .success(let response):
                print(response)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
