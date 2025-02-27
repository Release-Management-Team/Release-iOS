//
//  Regex.swift
//  Release-iOS
//
//  Created by 신지원 on 2/27/25.
//

import UIKit

// 날짜 변환
func convertDate(_ dateString: String) -> String? {
    let isoFormatter = ISO8601DateFormatter()
    isoFormatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
    
    if let date = isoFormatter.date(from: dateString) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy년 MM월 dd일 HH:mm"
        dateFormatter.locale = Locale(identifier: "ko_KR")
        dateFormatter.timeZone = TimeZone(identifier: "Asia/Seoul")
        
        return dateFormatter.string(from: date)
    }
    
    return nil
}

// 전화번호 변환
func formatPhoneNumber(_ number: String) -> String {
    if number.count == 11 {
        
        let first = number.prefix(3)
        let middle = number.dropFirst(3).prefix(4)
        let last = number.suffix(4)
        
        return "\(first)-\(middle)-\(last)"
    } else if number.count == 10 {
        let first = number.prefix(2)
        let middle = number.dropFirst(3).prefix(4)
        let last = number.suffix(4)
        
        return "\(first)-\(middle)-\(last)"
    } else {
        return number
    }
}

// 유효성 검사 (영문 + 숫자 또는 특수문자 포함, 8~20자)
func validateRegex(inputField: UITextField, regex: String = "^(?=.*[A-Za-z])(?=.*\\d|.*[^\\w\\s]).{8,20}$", warningLabel: UILabel) -> Bool {
    let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
    let isValid = predicate.evaluate(with: inputField.text)
    return isValid
}
