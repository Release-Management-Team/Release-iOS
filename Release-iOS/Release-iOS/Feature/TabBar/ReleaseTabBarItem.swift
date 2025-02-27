//
//  ReleaseTabBarItem.swift
//  Release-iOS
//
//  Created by 신지원 on 11/18/24.
//

import UIKit

enum ReleaseTabBarItem: CaseIterable {
    
//    case home, activity, book, myPage
    case home,  book, myPage
    
    var normalItemImage: UIImage {
        switch self {
        case .home:
            return .icHome.withTintColor(.gray3, renderingMode: .alwaysTemplate)
//        case .activity:
//            return .icStudy.withTintColor(.gray3, renderingMode: .alwaysTemplate)
        case .book:
            return .icBook.withTintColor(.gray3, renderingMode: .alwaysTemplate)
        case .myPage:
            return .icProfile.withTintColor(.gray3, renderingMode: .alwaysTemplate)
        }
    }
    
    var selectedItemImage: UIImage {
        switch self {
        case .home:
            return .icHome.withTintColor(.primary1, renderingMode: .alwaysTemplate)
//        case .activity:
//            return .icStudy.withTintColor(.primary1, renderingMode: .alwaysTemplate)
        case .book:
            return .icBook.withTintColor(.primary1, renderingMode: .alwaysTemplate)
        case .myPage:
            return .icProfile.withTintColor(.primary1, renderingMode: .alwaysTemplate)
        }
    }
    
    var itemTitle: String {
        switch self {
        case .home:
            return "홈"
//        case .activity:
//            return "활동"
        case .book:
            return "도서"
        case .myPage:
            return "마이"
        }
    }
    
    func itemViewController() -> UIViewController {
        switch self {
        case .home:
            return HomeViewController(service: DefaultNoticeService())
//        case .activity:
//            return ActivityViewController()
        case .book:
            return BookViewController(service: DefaultBookService())
        case .myPage:
            return MyPageViewController(service: DefaultMemberService())
        }
    }
}
