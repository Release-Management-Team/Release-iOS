//
//  LoginRequest.swift
//  Release-iOS
//
//  Created by 신지원 on 2/10/25.
//

struct LoginRequest: Encodable {
    let id: String
    let password: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case password
    }
}
