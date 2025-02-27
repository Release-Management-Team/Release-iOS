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
    
struct ActivityDTO: Codable {
    let type: String
    let name: String
    let description: String
    let leader: String
    let members: [String]
    let tags: [String]
    let state: String
    let image: String
    let link: String
}
