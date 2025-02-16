//
//  ReleaseTabBarItem.swift
//  Release-iOS
//
//  Created by 신지원 on 11/18/24.
//

import UIKit

enum ReleaseTabBarItem: CaseIterable {
    
    case home, search, feed, myPage
    
    var normalItemImage: UIImage {
        switch self {
        case .home:
            return .icHome.withTintColor(.gray3, renderingMode: .alwaysTemplate)
        case .search:
            return .icStudy.withTintColor(.gray3, renderingMode: .alwaysTemplate)
        case .feed:
            return .icBook.withTintColor(.gray3, renderingMode: .alwaysTemplate)
        case .myPage:
            return .icProfile.withTintColor(.gray3, renderingMode: .alwaysTemplate)
        }
    }
    
    var selectedItemImage: UIImage {
        switch self {
        case .home:
            return .icHome.withTintColor(.primary1, renderingMode: .alwaysTemplate)
        case .search:
            return .icStudy.withTintColor(.primary1, renderingMode: .alwaysTemplate)
        case .feed:
            return .icBook.withTintColor(.primary1, renderingMode: .alwaysTemplate)
        case .myPage:
            return .icProfile.withTintColor(.primary1, renderingMode: .alwaysTemplate)
        }
    }
    
    var itemTitle: String {
        switch self {
        case .home:
            return "홈"
        case .search:
            return "활동"
        case .feed:
            return "도서"
        case .myPage:
            return "마이"
        }
    }
    
    func itemViewController() -> UIViewController {
        switch self {
        case .home:
            return HomeViewController(service: DefaultNoticeService())
        case .search:
            return ActivityViewController()
        case .feed:
            return BookViewController()
        case .myPage:
            return MyPageViewController()
        }
    }
}
