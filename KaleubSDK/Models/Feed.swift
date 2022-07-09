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
    /// 해당 타입의 아이디
    public var id: IdentifierType
    /// 작성자 아이디
    public var userId: Int64
    /// 피드 제목
    public var title: String
    /// 피드 내용
    public var content: String
    /// 피드 사진
    public var imageUrls: [String]
    
    /// 해당하는 아이디의 타입.
    public enum IdentifierType: Int64 {
        /// 룸 아이디
        case roomId
        /// 피드 아이디
        case feedId
    }
    
    enum CodingKeys: String, CodingKey {
        case createdDate = "createdAt"
        case modifiedDate = "updatedAt"
        case id
        case code
        case ownerEmail
        case title
        case password
        case participantsCount
    }
    
    public init(
        createdDate: Double,
        modifiedDate: Double,
        id: IdentifierType,
        userId: Int64,
        title: String,
        content: String,
        imageUrls: [String]
    ) {
        self.id = id
        self.userId = userId
        self.title = title
        self.content = content
        self.imageUrls = imageUrls
        // NOTE: - imageUrl 바로 UIImage로 바꿔버릴까??
        self.createdDate = createdDate
        self.modifiedDate = modifiedDate
    }
    
    // TODO: - required 작성하기
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.createdDate = try container.decode(Double.self, forKey: .createdDate)
        self.modifiedDate = try container.decode(Double.self, forKey: .modifiedDate)
        self.id = try container.decode(IdentifierType.self, forKey: .IdentifierType)
        self.userId = try container.decode(Int64.self, forKey: .)
        self.title = try container.decode(String.self, forKey: .title)
    }
}
