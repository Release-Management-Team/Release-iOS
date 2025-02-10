//
//  LoginResponse.swift
//  Release-iOS
//
//  Created by 신지원 on 2/10/25.
//

struct LoginResponse: Decodable {
    let acessToken: String
    let refreshToken: String
}
