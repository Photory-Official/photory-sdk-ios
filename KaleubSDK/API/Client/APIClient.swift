//
//  APIClient.swift
//  KaleubSDK
//
//  Created by Hamlit Jason on 2022/06/16.
//

import Combine

class APIClient: ObservableObject {
    static let urlString: String = {
        return "http://13.125.253.133:8080"
    }()

    enum Method {
        case post
        case get
        case delete
        case put

        var stringValue: String {
            switch self {
            case .post: return "POST"
            case .get: return "GET"
            case .delete: return "DELETE"
            case .put: return "PUT"
            }
        }
    }

    enum APIError: Error {
        case invalidURLRequest
        case noDataFromResponse
        case failedToRequest
        case failedToDecodeResponse
        case statusCode(_ statusCode: Int)
    }

    let baseURL: URL

    init(urlString: String = APIClient.urlString) {
        guard let baseURL = URL(string: urlString) else {
            fatalError("Failed to create URL from \(urlString)")
        }

        self.baseURL = baseURL
    }

    private func send<RequestType: Request & Respondable>(_ request: RequestType, resultHandler: @escaping (Result<RequestType.ResponseType, Error>) -> Void) {
        
        guard var urlRequest = request.urlRequst(baseURL: baseURL) else {
            resultHandler(.failure(APIError.invalidURLRequest))
            return
        }
        urlRequest.addValue(
            "application/json",
            forHTTPHeaderField: "Content-Type"
        )
        
        print(urlRequest)
        // NOTE: - status 500번대가 내려옵니다 포스트맨에서는 정상적으로 작동 확인했는데 해결이 필요합니다.
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            // NOTE: - 서버가 죽은 경우 컴플리션이 호출되지 않습니다!
            if let error = error {
                resultHandler(.failure(error))
                return
            }
            
            guard let data = data else {
                resultHandler(.failure(APIError.noDataFromResponse))
                return
            }
            
            guard let response = response as? HTTPURLResponse, (200..<300) ~= response.statusCode else {
                resultHandler(.failure(APIError.failedToRequest))
                
                return
            }
            
            guard let output = try? JSONDecoder().decode(RequestType.ResponseType.self, from: data) else {
                resultHandler(.failure(APIError.failedToDecodeResponse))
                return
            }
            
            resultHandler(.success(output))
        }
        .resume()
    }
    
    // MARK: - signUp
    
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
