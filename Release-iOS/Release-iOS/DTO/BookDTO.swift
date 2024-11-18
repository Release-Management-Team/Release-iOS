//
//  BookDTO.swift
//  Release-iOS
//
//  Created by 신지원 on 8/22/24.
//

import Foundation

struct BooksResponse: Decodable {
    let books: [BookDTO]
}

struct BookDTO: Codable, Identifiable {
    let id: String
    let title: String
    let availability: String
    let author: String
    let tags: [String]
    let image: String
}

enum BookStatus: String, CaseIterable {
    case available = "대여 가능"
    case rented = "대여 중"
    case unavailable = "대여 불가"
}
