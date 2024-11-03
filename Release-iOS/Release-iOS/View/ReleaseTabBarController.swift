//
//  TabBarViewController.swift
//  Release-iOS
//
//  Created by 신지원 on 11/4/24.
//

import UIKit

import Then

final class ReleaseTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setTabBarController()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        var tabBarHeight: CGFloat = 80 + view.safeAreaInsets.bottom
        if UIScreen.isSE {
            tabBarHeight += 5
        }
        tabBar.frame.size.height = tabBarHeight
        tabBar.frame.origin.y = view.frame.height - tabBarHeight
        
        let itemWidth: CGFloat = 30
        let itemSpacing: CGFloat = (tabBar.bounds.width - (itemWidth * CGFloat(tabBar.items?.count ?? 0))) / CGFloat(tabBar.items?.count ?? 1 + 1)
        var xOffset = itemSpacing
        
        for itemView in tabBar.subviews where itemView is UIControl {
            itemView.frame = CGRect(x: xOffset, y: itemView.frame.origin.y, width: itemWidth, height: itemView.frame.height)
            xOffset += itemWidth + itemSpacing
        }
    }
    
    //MARK: - UI
    
    private func setUI() {
        view.do {
            $0.backgroundColor = .black2
        }
        
        tabBar.do {
            let border = CALayer()
            border.backgroundColor = UIColor.black2.cgColor
            border.frame = CGRect(x: 0, y: 0, width: $0.frame.width, height: 1)
            
            $0.layer.addSublayer(border)
            $0.isTranslucent = false
            $0.itemPositioning = .centered
            $0.layer.masksToBounds = true
            $0.tintColor = .primary1
            $0.unselectedItemTintColor = .gray3
        }
    }
    
    //MARK: - Custom Method
    
    private func setTabBarController() {
        var navigationControllers = [UINavigationController]()
        
        for item in ReleaseTabBarItem.allCases {
            let viewController = item.itemViewController()
            let navigationController = createNavigationController(
                normalImage: item.normalItemImage,
                selectedImage: item.selectedItemImage,
                title: item.itemTitle,
                viewController: viewController
            )
            navigationControllers.append(navigationController)
        }
        
        setViewControllers(navigationControllers, animated: true)
    }
    
    private func createNavigationController(normalImage: UIImage,
                                            selectedImage: UIImage,
                                            title: String,
                                            viewController: UIViewController) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: viewController)
        
        let item = UITabBarItem(
            title: title,
            image: normalImage,
            selectedImage: selectedImage
        )
        
        navigationController.setNavigationBarHidden(true, animated: true)
        navigationController.tabBarItem = item
        
        return navigationController
    }
}

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
            return HomeViewController()
            
        case .search:
            return HomeViewController()
            
        case .feed:
            return HomeViewController()
            
        case .myPage:
            return HomeViewController()
        }
    }
}
