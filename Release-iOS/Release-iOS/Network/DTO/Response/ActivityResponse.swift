//
//  ActivityResponse.swift
//  Release-iOS
//
//  Created by 신지원 on 8/22/24.
//

import Foundation

struct ActivityResponse: Decodable {
    let activities: [ActivityDTO]
}
    
struct ActivityDTO: Decodable {
    let id: Int
    let title: String
    let leader: String
    let image: String
    let info: Int
    let state: Int
}
