//
//  NoticeDTO.swift
//  Release-iOS
//
//  Created by 신지원 on 8/24/24.
//

import Foundation

struct Notice: Identifiable {
    let id = UUID()
    let title: String
    let content: String
    let date: String
}
