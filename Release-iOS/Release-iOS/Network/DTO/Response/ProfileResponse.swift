//
//  ProfileResponse.swift
//  Release-iOS
//
//  Created by 신지원 on 12/6/24.
//

import Foundation

struct ProfileResponse: Decodable {
    let member: ProfileDTO
}

struct ProfileDTO: Decodable {
    let id: String
    let name: String
    let state: Int
    let image: String
    let message: String
    let role: Int
    let department: String
    let phone: String
    let email: String
    let joined_semester: String
    let new: Bool
}
