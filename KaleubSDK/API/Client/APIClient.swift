//
//  APIClient.swift
//  KaleubSDK
//
//  Created by Hamlit Jason on 2022/06/16.
//

import Combine

class APIClient: ObservableObject {
    static let urlString: String = {
        return "http://13.124.230.72:8080"
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

    func send<RequestType: Request & Respondable>(_ request: RequestType, resultHandler: @escaping (Result<RequestType.ResponseType, Error>) -> Void) {
        
        guard var urlRequest = request.urlRequst(baseURL: baseURL) else {
            resultHandler(.failure(APIError.invalidURLRequest))
            return
        }
        urlRequest.addValue(
            "application/json",
            forHTTPHeaderField: "Content-Type"
        )
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
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
}
