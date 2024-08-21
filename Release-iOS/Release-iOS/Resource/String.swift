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
    
    enum My {
        static let staff = "임원"
        
        static let studentNumber = "학번"
        static let major = "학과"
        static let period = "활동기간"
        static let email = "이메일"
        static let phone = "전화번호"
        
        static let goal = "학회원 자격 조건 달성 여부"
        
        static let check = "참여 중인 활동"
        static let activityCheck = "참여 중인 스터디/프로젝트 확인하기"
        static let bookCheck = "대여 중인 도서 확인하기"
        
        static let edit = "정보 수정"
        static let infoEdit = "개인정보 수정"
        static let passwordEdit = "비밀번호 변경"
    }
}
