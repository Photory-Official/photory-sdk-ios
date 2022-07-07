//
//  Feed.swift
//  KaleubSDK
//
//  Created by Hamlit Jason on 2022/07/07.
//

import Foundation

public class Feed: Codable {
    
    /// 방 생성시간
    public var createdDate: Double
    /// 방 수정시간
    public var modifiedDate: Double
    /// 방 고유 아이디
    public var roomId: Int64
    /// 작성자 아이디
    public var userId: Int64
    /// 피드 제목
    public var title: String
    /// 피드 내용
    public var content: String
    /// 피드 사진
    public var imageUrls: [String]
    
    enum CodingKeys: String, CodingKey {
        case id
        case code
        case ownerEmail
        case title
        case password
        case participantsCount
        case createdDate = "createdAt"
        case modifiedDate = "updatedAt"
    }
    
    public init(
        createdDate: Double,
        modifiedDate: Double,
        roomId: Int64,
        userId: Int64,
        title: String,
        content: String,
        imageUrls: [String]
    ) {
        self.roomId = roomId
        self.userId = userId
        self.title = title
        self.content = content
        self.imageUrls = imageUrls
        // NOTE: - imageUrl 바로 UIImage로 바꿔버릴까??
        self.createdDate = createdDate
        self.modifiedDate = modifiedDate
    }
    
    // TODO: - required 작성하기
}
