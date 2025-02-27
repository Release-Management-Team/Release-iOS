//
//  URL.swift
//  Release-iOS
//
//  Created by 신지원 on 8/28/24.
//

import Foundation

struct ReleaseURL {
    enum auth {
        static let auth = "/auth"
        static let login = auth + "/login"
        static let validateToken = auth + "/validate-token"
        static let refreshToken = auth + "/refresh-jwt-token"
    }
    
    enum member {
        static let member = "/member"
        static let myProfile = member + "/my-profile"
        static let updateProfile = member + "/update-profile"
        static let changePassword = myProfile + "/change-password"
        static let memberList = member + "/member-list"
        static let memberProfile = member + "/member-profile"
    }
    
    enum book {
        static let book = "/book"
        static func bookRead(bookId: String) -> String {
            return "\(book)/\(bookId)"
        }
        static func bookBorrow(bookId: String) -> String {
            return "\(book)/\(bookId)/borrow"
        }
        static func bookReturn(bookId: String) -> String {
            return "\(book)/\(bookId)/return"
        }
    }
    
    enum notice {
        static let notice = "/notice"
        static let uploadToken = notice + "/upload-fcm-token"
    }
    
    enum activity {
        static let activity = "/activity"
        static let studies = activity + "/studies"
        static let projects = activity + "/projects"
    }
}
