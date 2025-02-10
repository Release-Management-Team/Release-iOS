//
//  MyResponse.swift
//  Release-iOS
//
//  Created by 신지원 on 8/22/24.
//

import Foundation

struct MyResponse: Decodable {
    let name: String
    let staff: Bool
    let status: String
    let studentNumber: Int
    let major: String
    let period: String
    let email: String
    let phone: String
}
