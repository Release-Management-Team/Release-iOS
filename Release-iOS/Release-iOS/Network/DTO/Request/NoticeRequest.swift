//
//  NoticeRequest.swift
//  Release-iOS
//
//  Created by 신지원 on 3/23/25.
//

struct NoticeRequest: Encodable {
    let title: String
    let content: String
    let important: Bool
    
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case content = "content"
        case important = "important"
    }
}
