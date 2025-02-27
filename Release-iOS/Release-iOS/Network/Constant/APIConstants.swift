//
//  APIConstants.swift
//  Release-iOS
//
//  Created by 신지원 on 2/14/25.
//

import Foundation

struct APIConstants {
    static let contentType = "Content-Type"
    static let applicationJSON = "application/json"
    static let authorization = "Access"
    static var accessToken: String {
        let token = UserDefaults.standard.string(forKey: StringLiterals.UserDefault.accessToken) ?? ""
        return token
    }
    static var refreshToken: String {
        let token = UserDefaults.standard.string(forKey: StringLiterals.UserDefault.refreshToken) ?? ""
        return token
    }
}

extension APIConstants {
    static var noTokenHeaders: [String : String] {
        [contentType : applicationJSON]
    }
    
    static var tokenHeaders: [String : String] {
        [contentType: applicationJSON, authorization: "Bearer " + accessToken]
    }
}
