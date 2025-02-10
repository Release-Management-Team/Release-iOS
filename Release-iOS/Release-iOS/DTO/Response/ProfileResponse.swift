//
//  ProfileResponse.swift
//  Release-iOS
//
//  Created by 신지원 on 12/6/24.
//

import Foundation

struct ProfileResponse: Decodable {
    let id: String
    let name: String
    let department: String
    let phone: String
    let email: String
    let state: Int
    let role: Int
    let message: String?
    let image: String
    let joined_semester: String
    let new: Bool
}
