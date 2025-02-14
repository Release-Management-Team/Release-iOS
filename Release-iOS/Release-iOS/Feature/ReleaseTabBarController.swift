//
//  TabBarViewController.swift
//  Release-iOS
//
//  Created by 신지원 on 11/4/24.
//

import UIKit

final class ReleaseTabBarController: UITabBarController, UITabBarControllerDelegate {
    
    //MARK: - Properties
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setTabBarController()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        var tabBarHeight: CGFloat = 96
        if UIScreen.isSE {
            tabBarHeight += 5
        }
        
        tabBar.frame.size.height = tabBarHeight
        tabBar.frame.origin.y = view.frame.height - tabBarHeight
    }
    
    //MARK: - UI
    
    private func setUI() {
        view.backgroundColor = .black2
        
        tabBar.do {
            let border = CALayer()
            border.backgroundColor = UIColor.black2.cgColor
            border.frame = CGRect(x: 0, y: 0, width: $0.frame.width, height: 1)
            
            $0.layer.addSublayer(border)
            $0.isTranslucent = false
            $0.itemPositioning = .centered
            $0.tintColor = .primary1
            $0.unselectedItemTintColor = .gray3
            $0.layer.masksToBounds = true
        }
    }
    
    //MARK: - Custom Methods
    
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
