//
//  Config.swift
//  Release-iOS
//
//  Created by 신지원 on 8/28/24.
//

import Foundation

enum Config {
    static let baseURL = Bundle.main.infoDictionary?["BASE_URL"] as! String
    static let testAccessToken = Bundle.main.infoDictionary?["TEST_ACCESS_TOKEN"] as! String
    static let testRefreshToken = Bundle.main.infoDictionary?["TEST_REFRESH_TOKEN"] as! String
    
    static let accessToken = UserDefaults.standard.string(forKey: StringLiterals.UserDefault.accessToken)
    static let refreshToken = UserDefaults.standard.string(forKey: StringLiterals.UserDefault.refreshToken)
}
