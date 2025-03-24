//
//  FCMTokenResult.swift
//  Release-iOS
//
//  Created by 신지원 on 3/18/25.
//

import Foundation

struct FCMTokenRequest: Encodable {
    let uuid: String
    let fcmToken: String
    
    enum CodingKeys: String, CodingKey {
        case uuid
        case fcmToken = "fcm_token"
    }
}
