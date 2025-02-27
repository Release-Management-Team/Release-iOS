//
//  LoginResponse.swift
//  Release-iOS
//
//  Created by 신지원 on 2/10/25.
//

struct LoginResponse: Decodable {
    let accessToken: String
    let refreshToken: String
    
    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case refreshToken = "refresh_token"
    }
}
