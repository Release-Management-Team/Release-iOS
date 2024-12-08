//
//  MyPageViewController.swift
//  Release-iOS
//
//  Created by 신지원 on 12/6/24.
//

import UIKit

import SnapKit
import Then

final class MyPageViewController: UIViewController {
    
    private let rootView = MyPageView()
    
    override func loadView() {
        self.view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getNoticeData()
        setButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        navigationController?.navigationBar.isHidden = true
        showTabBar()
    }
    
    private func setButton() {
        self.rootView.passwordButton.addTarget(self, action: #selector(passwordButtonTapped), for: .touchUpInside)
    }
    
    @objc
    private func passwordButtonTapped() {
        let vc = MyPageChangePasswordViewController()
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension MyPageViewController {
    private func getNoticeData() {
        getNoticeList { [weak self] success in
            DispatchQueue.main.async {
                if success {
                    print("Successfully fetched notice list!")
                } else {
                    print("Failed to fetch notice list.")
                }
            }
        }
    }
    
    private func getNoticeList(completion: @escaping (Bool) -> Void) {
        guard let url = URL(string: Config.baseURL + "/member/profile") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("application/json",
                         forHTTPHeaderField: "Content-Type")
        
        if let accessToken = UserDefaults.standard.string(forKey: "accessToken") {
            request.addValue("Bearer \(String(describing: accessToken))", forHTTPHeaderField: "Access")
        } else {
            print("Access Token is missing")
        }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Request failed with error: \(error)")
                completion(false)
                return
            }
            
            guard let data = data else {
                print("Error: No data received.")
                completion(false)
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                print("Error: Response is not HTTPURLResponse. Response: \(String(describing: response))")
                completion(false)
                return
            }
            
            guard httpResponse.statusCode == 200 else {
                print("Error: HTTP Status Code is \(httpResponse.statusCode)")
                completion(false)
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let profileData = try decoder.decode(ProfileDTO.self, from: data)
                
                DispatchQueue.main.async {
                    self.rootView.bindData(data: profileData)
                    completion(true)
                }
            } catch {
                print("Failed to parse JSON: \(error)")
                completion(false)
            }
        }.resume()
    }
}


