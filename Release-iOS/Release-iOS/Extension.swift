//
//  isSE.swift
//  Release-iOS
//
//  Created by 신지원 on 11/4/24.
//

import UIKit

extension UIScreen {
    static var isSE: Bool { UIScreen.main.bounds.height < 680 }
}

extension UIViewController {
    func showTabBar() {
        if let tabBarController = self.tabBarController as? ReleaseTabBarController {
            tabBarController.tabBar.isHidden = false
        }
    }
    
    func hideTabBar() {
        if let tabBarController = self.tabBarController as? ReleaseTabBarController {
            tabBarController.tabBar.isHidden = true
        }
    }
    
    func setNavigationBar(title: String, left: UIButton?, right: UIButton?) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationItem.title = title
        
        if let navigationBar = self.navigationController?.navigationBar {
            let titleTextAttributes: [NSAttributedString.Key: Any] = [
                .font: UIFont.heading3,
                .foregroundColor: UIColor.gray1
            ]
            navigationBar.titleTextAttributes = titleTextAttributes
        }
        
        self.navigationItem.leftBarButtonItem = left != nil ? UIBarButtonItem(customView: left!) : nil
        self.navigationItem.rightBarButtonItem = right != nil ? UIBarButtonItem(customView: right!) : nil
    }
}
