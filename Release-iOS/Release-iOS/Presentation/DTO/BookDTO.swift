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
    let status: String
    let title: String
    let author: String
    let year: String
    let publisher: String
}
