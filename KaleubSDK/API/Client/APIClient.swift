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
    
    
}
