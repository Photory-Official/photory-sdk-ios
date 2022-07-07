//
//  Feed.swift
//  KaleubSDK
//
//  Created by Hamlit Jason on 2022/07/07.
//

import Foundation

public class Feed: Codable {
    /// 방 고유 아이디
    var roomId: Int64
    /// 작성자 아이디
    var userId: Int64
    /// 피드 제목
    var title: String
    /// 피드 내용
    var content: String
    /// 피드 사진
    var imageUrls: [String]
    
    init(
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
    }
}
