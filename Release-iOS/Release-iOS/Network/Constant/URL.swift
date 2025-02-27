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
        static let info = book + "/info"
        static let borrow = book + "/borrow"
        static let bookReturn = book + "/return"
        static let borrowing = book + "/borrowing"
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
