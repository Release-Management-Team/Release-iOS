//
//  BookDTO.swift
//  Release-iOS
//
//  Created by 신지원 on 8/22/24.
//

import Foundation

struct BookDTO: Identifiable {
    let id = UUID()
    let image: String
    let status: BookStatus
    let title: String
    let author: String
    let tag: String
}

enum BookStatus: String, CaseIterable {
    case available = "대여 가능"
    case rented = "대여 중"
    case unavailable = "대여 불가"
}
