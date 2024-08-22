//
//  EventDTO.swift
//  Release-iOS
//
//  Created by 신지원 on 8/22/24.
//

import Foundation

struct EventDTO: Identifiable {
    let id = UUID()
    let category: String
    let title: String
    let content: String
    let start: String
    let end: String
    let place: String
}