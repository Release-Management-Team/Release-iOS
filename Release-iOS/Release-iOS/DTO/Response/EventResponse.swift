//
//  EventResponse.swift
//  Release-iOS
//
//  Created by 신지원 on 8/22/24.
//

import Foundation

struct EventResponse: Decodable {
    let evets: [EventDTO]
}

struct EventDTO: Codable {
    let name: String
    let description: String
    let start_time: String
    let end_time: String
    let place: String
}
