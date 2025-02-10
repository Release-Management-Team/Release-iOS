//
//  WeeklyEventResponse.swift
//  Release-iOS
//
//  Created by 신지원 on 8/22/24.
//

import Foundation

struct WeeklyEventResponse: Decodable {
    let category: String
    let title: String
    let time: String
}
