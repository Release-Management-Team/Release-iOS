//
//  ActivityDTO.swift
//  Release-iOS
//
//  Created by 신지원 on 8/22/24.
//

import Foundation

struct ActivityResult: Decodable {
    let activity: [Activity]
}

struct Activity: Codable {
    let model: String
    let pk: Int
    let fields: ActivityDTO
}
    
struct ActivityDTO: Codable {
    let name: String
    let description: String
    let leader: String
    let members: [String]
    let tags: [String]
    let state: String
    let image: Bool
    let link: String?
}
