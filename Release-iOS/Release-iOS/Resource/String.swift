//
//  String.swift
//  Release-iOS
//
//  Created by 신지원 on 8/15/24.
//

import Foundation

struct StringLiterals {
    enum Navigation {
        static let activity = "활동"
        static let book = "도서"
        static let my = "마이페이지"
    }
    
    enum Home {
        static let notice = "Notice"
        static let weekly = "Weekly Events"
        static let weeklyDay = ["월", "화", "수", "목", "금", "토", "일"]
    }
    
    enum Activity {
        static let study = "스터디/프로젝트"
        static let event = "이벤트"
    }
}
