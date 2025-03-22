//
//  EventResponse.swift
//  Release-iOS
//
//  Created by 신지원 on 8/22/24.
//

import Foundation

struct EventsResponse: Decodable {
    let events: [EventDTO]
}

struct EventDTO: Codable {
    let id: Int
    let title: String
    let start_time: String
    let place: String
}
