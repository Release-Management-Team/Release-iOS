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
}

extension APIConstants {
    static var noTokenHeaders: [String : String] {
        [applicationJSON : contentType]
    }
}
