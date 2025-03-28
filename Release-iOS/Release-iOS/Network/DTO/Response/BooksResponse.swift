//
//  BooksResponse.swift
//  Release-iOS
//
//  Created by 신지원 on 8/22/24.
//

import Foundation

struct BooksResponse: Decodable {
    let books: [BookDTO]
}

struct BookResponse: Decodable {
    let book: BookDTO
}

struct BookDTO: Decodable {
    let id: String
    let title: String
    let availability: String
    let author: String
    let tags: [String]
    let image: String
}
