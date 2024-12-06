//
//  NoticeDTO.swift
//  Release-iOS
//
//  Created by 신지원 on 8/24/24.
//

import Foundation

struct NoticesResponse: Decodable {
    let notices: [NoticeDTO]
}

struct NoticeDTO: Codable {
    let title: String
    let content: String
    let date: String
    let important: Bool
}
