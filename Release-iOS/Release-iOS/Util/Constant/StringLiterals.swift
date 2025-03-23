//
//  String.swift
//  Release-iOS
//
//  Created by 신지원 on 8/15/24.
//

import Foundation

struct StringLiterals {
    enum UserDefault {
        static let accessToken = "accessToken"
        static let refreshToken = "refreshToken"
        static let password = "password"
    }
    
    enum Login {
        static let id = "학번"
        static let password = "비밀번호"
        static let buttonTitle = "로그인"
    }
    
    enum Navigation {
        static let notice = "공지"
        static let activity = "활동"
        static let book = "도서"
        static let my = "마이페이지"
        static let infoEdit = "개인정보 수정"
        static let passwordEdit = "비밀번호 변경"
        static let activityCheck = "나의 스터디/프로젝트"
        static let bookCheck = "대여 중인 도서"
        static let manage = "학회 관리"
    }
    
    enum Home {
        static let notice = "Notice"
        static let weekly = "Weekly Events"
        static let weeklyDay = ["월", "화", "수", "목", "금", "토", "일"]
        
        static let linksTitle = "릴리즈 플랫폼 바로가기"
        static let website = "Website"
        static let notion = "Notion"
        static let discord = "Discord"
    }
    
    enum Activity {
        static let study = "스터디/프로젝트"
        static let event = "이벤트"
        static let join = "참여하기"
    }
    
    enum Book {
        static let avaliable = "대여하기"
        static let unavaliable = "대여 불가"
        static let returnBook = "반납하기"
    }
    
    enum My {
        static let staff = "임원"
        
        static let studentNumber = "학번"
        static let major = "학과"
        static let status = "상태메세지"
        static let period = "가입기간"
        static let email = "이메일"
        static let phone = "전화번호"
        
        static let dummyName = "릴리즈"
        static let dummyStudentNumber = "00000000"
        static let dummyMajor = ""
        static let dummyStatus = "상태메세지"
        static let dummyPeriod = "~"
        static let dummyEmail = ""
        static let dummyPhone = "010-0000-0000"
        
        static let goal = "학회원 자격 조건"
        
        static let check = "참여 중인 활동"
        static let activityCheck = "나의 스터디/프로젝트 확인하기"
        static let bookCheck = "대여 중인 도서 확인하기"
        
        static let edit = "정보 수정"
        static let infoEdit = "개인정보 수정"
        static let passwordEdit = "비밀번호 변경"
        
        static let currentPassword = "현재 비밀번호"
        static let newPassword = "새 비밀번호"
        static let checkPassword = "새 비밀번호 확인"
        static let isNotSame = "비밀번호가 일치하지 않습니다."
        static let passwordCondition = "영문, 숫자가 조합된 8~20자"
        static let warningPassword = "영문, 숫자가 조합된 8~20자로 설정해주세요."
        
        static let changeButtonTitle = "변경하기"
    }
    
    enum Manage {
        static let postNotice = "공지 작성 완료"
    }
}
