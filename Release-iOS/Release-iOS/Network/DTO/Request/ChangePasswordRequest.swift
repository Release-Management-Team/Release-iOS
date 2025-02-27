//
//  ChangePasswordRequest.swift
//  Release-iOS
//
//  Created by 신지원 on 2/27/25.
//

struct ChangePasswordRequest: Encodable {
    let oldPassword: String
    let newPassword: String
    
    enum CodingKeys: String, CodingKey {
        case oldPassword = "old_password"
        case newPassword = "new_password"
    }
}
