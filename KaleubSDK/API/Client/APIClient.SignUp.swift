//
//  APIClient.SignUp.swift
//  KaleubSDK
//
//  Created by Hamlit Jason on 2022/06/17.
//

import Foundation

// MARK: - SignUp

extension APIClient {
    func signUp(email: String, password: String, resultHandler: @escaping (Result<Void, Error>) -> Void) {
        let request = SignUpRequest(email: email, password: password)
        self.send(request) { result in
            switch result {
            case .success(let response):
                print(response)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func checkEmailValidation(email: String, resultHandler: @escaping (Result<Void, Error>) -> Void) {
        let request = CheckEmailValidationRequest(email: email)
        self.send(request) { result in
            switch result {
            case .success(let response):
                print(response)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func sendVerificationMail(to email: String, resultHandler: @escaping (Result<Void, Error>) -> Void) {
        let request = SendVerificationMailRequest(email: email)
        self.send(request) { result in
            switch result {
            case .success(let response):
                print(response)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func checkVerificationValidation(email: String, authKey: String, resultHandler: @escaping (Result<Void, Error>) -> Void) {
        let request = CheckVerificationValidationRequest(email: email, authKey: authKey)
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
