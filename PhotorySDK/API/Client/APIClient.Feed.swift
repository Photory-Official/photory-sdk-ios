//
//  APIClient.FeedFetch.swift
//  KaleubSDK
//
//  Created by Hamlit Jason on 2022/07/07.
//

import Foundation
import UIKit

// NOTE: - 이관 완료
extension APIClient {
    
    // FIXME: 이미지(파일) 타입을 서버로 올리는 것을 해보지 않아서 일단 작성은 해두나 이 부분에 대해서는 구글링 필요 - 혁준님 답: multipart/form-data로 해야한다.
    func createFeed(image: [UIImage], roomId: Int64, title: String, content: String, resultHandler: @escaping (Result<Void, Error>) -> Void) {
        let reqeust = FeedCreateRequest(image: image, roomId: roomId, title: title, content: content)
        self.send(reqeust) { result in
            switch result {
            case .success:
                resultHandler(.success(()))
            case .failure(let error):
                resultHandler(.failure(error))
            }
        }
    }
    
    func updateFeed(feedId: Int64, title: String, content: String, resultHandler: @escaping (Result<Feed, Error>) -> Void) {
        let reqeust = FeedUpdateRequest(feedId: feedId, title: title, content: content)
        self.send(reqeust) { result in
            switch result {
            case .success(let response):
                resultHandler(.success(response.feed))
            case .failure(let error):
                resultHandler(.failure(error))
            }
        }
    }
    
    func deleateFeed(feedId: Int64, resultHandler: @escaping (Result<Void, Error>) -> Void) {
        let request = FeedDeleteRequest(feedId: feedId)
        self.send(request) { result in
            switch result {
            case .success:
                resultHandler(.success(()))
            case .failure(let error):
                resultHandler(.failure(error))
            }
        }
    }
    
    func fetchFeedList(roomId: Int64, size: Int, lastFeedId: Int64, resultHandler: @escaping (Result<FeedContent?, Error>) -> Void) {
        let request = FeedListRequest(roomId: roomId, size: size, lastFeedId: lastFeedId)
        self.send(request) { result in
            switch result {
            case .success(let response):
                let feedContents = response.feedContents
                resultHandler(.success((feedContents)))
            case .failure(let error):
                resultHandler(.failure(error))
            }
        }
    }
}
