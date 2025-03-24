//
//  isSE.swift
//  Release-iOS
//
//  Created by 신지원 on 11/4/24.
//

import UIKit

extension UIViewController {
    
    //MARK: - Tabbar
    
    func showTabBar() {
        self.hidesBottomBarWhenPushed = false
    }
    
    func hideTabBar() {
        self.hidesBottomBarWhenPushed = true
    }
    
    //MARK: - Custom NavigationBar
    
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
    
    func setSmallFontNavigationBar(title: String, left: UIButton?, right: UIButton?) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .black1
        appearance.titleTextAttributes = [
            .font: UIFont.heading4,
            .foregroundColor: UIColor.gray1
        ]
        
        self.navigationController?.navigationBar.standardAppearance = appearance
        self.navigationController?.navigationBar.scrollEdgeAppearance = appearance
        self.navigationItem.title = title
        
        self.navigationItem.leftBarButtonItem = left != nil ? UIBarButtonItem(customView: left!) : nil
        self.navigationItem.rightBarButtonItem = right != nil ? UIBarButtonItem(customView: right!) : nil
    }
    
    //MARK: - Alert
    
    func showAlert(title: String, message: String, okAction: (() -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "확인", style: .default, handler: { _ in
            okAction?()
        }))
        
        present(alert, animated: true, completion: nil)
    }
    
    //MARK: - Open URL
    
    func openURL(_ urlString: String) {
        guard let url = URL(string: urlString),
              UIApplication.shared.canOpenURL(url) else {
            print("❌ 유효하지 않은 URL입니다: \(urlString)")
            return
        }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
}
