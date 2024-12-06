//
//  HomeViewController.swift
//  Release-iOS
//
//  Created by 신지원 on 11/4/24.
//

import UIKit

import SnapKit
import Then

final class HomeViewController: UIViewController {
    
    private var noticeData:String = ""
    
    private let logoImageView = UIImageView(image: UIImage(named: "releaseLogo")).then {
        $0.contentMode = .scaleAspectFit
    }
    
    private let notificationButton = UIButton().then {
        $0.setImage(.icRing, for: .normal)
        $0.addTarget(self, action: #selector(noticeButtonTapped), for: .touchUpInside)
    }
    
    private let profileImageView = UIImageView(image: UIImage(named: "kuromiDummy")).then {
        $0.layer.cornerRadius = 24
        $0.clipsToBounds = true
    }
    
    private let combineView = UIView().then {
        $0.backgroundColor = .clear
    }
    
    private let greetingLabel = UILabel().then {
        $0.font = .heading3
        $0.textColor = .gray1
        $0.numberOfLines = 2
        $0.text = "행복한 하루 🧑🏻‍💻\n오늘도 버그없는 개발 되세요!"
    }
    
    private let noticeLabel = UILabel().then {
        $0.text = StringLiterals.Home.notice
        $0.font = .heading3
        $0.textColor = .primary1
    }
    
    private let noticeView = UIView().then {
        $0.backgroundColor = .primary1
        $0.layer.cornerRadius = 16
    }
    
    private let noticeContentLabel = UILabel().then {
        $0.font = .paragraph1
        $0.textColor = .black2
        $0.textAlignment = .left
    }
    
    private let weeklyLabel = UILabel().then {
        $0.text = StringLiterals.Home.weekly
        $0.font = .heading3
        $0.textColor = .gray1
        $0.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        getNoticeData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        navigationController?.navigationBar.isHidden = true
        showTabBar()
    }
    
    private func setupUI() {
        view.backgroundColor = .black1
        view.addSubview(logoImageView)
        view.addSubview(notificationButton)
//        view.addSubview(profileImageView)
        view.addSubview(combineView)

        combineView.addSubview(greetingLabel)
        combineView.addSubview(noticeView)
        combineView.addSubview(noticeLabel)
        noticeView.addSubview(noticeContentLabel)
        view.addSubview(weeklyLabel)
        
        logoImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(12)
            make.leading.equalToSuperview().offset(25)
            make.size.equalTo(CGSize(width: 80, height: 48))
        }
        
        notificationButton.snp.makeConstraints { make in
            make.centerY.equalTo(logoImageView)
            make.trailing.equalToSuperview().inset(24)
            make.size.equalTo(CGSize(width: 32, height: 32))
        }
        
//        profileImageView.snp.makeConstraints { make in
//            make.centerY.equalTo(logoImageView)
//            make.trailing.equalToSuperview().inset(24)
//            make.size.equalTo(CGSize(width: 48, height: 48))
//        }
        
        combineView.snp.makeConstraints {
            $0.top.equalTo(logoImageView.snp.bottom).offset(50)
//            $0.centerY.equalToSuperview().inset(-20)
            $0.leading.trailing.equalToSuperview().inset(24)
        }
        
        greetingLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
        }
        
        noticeLabel.snp.makeConstraints { make in
            make.top.equalTo(greetingLabel.snp.bottom).offset(40)
            make.bottom.leading.equalToSuperview()
        }
        
        noticeView.snp.makeConstraints { make in
            make.top.equalTo(noticeLabel.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview()
            
            noticeContentLabel.snp.makeConstraints { make in
                make.top.bottom.equalToSuperview().inset(24)
                make.leading.trailing.equalToSuperview().inset(16)
            }
        }
        
        weeklyLabel.snp.makeConstraints { make in
            make.top.equalTo(noticeView.snp.bottom).offset(32)
            make.leading.equalToSuperview().offset(24)
        }
    }
    
    @objc
    private func noticeButtonTapped() {
        let vc = NoticeViewController()
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension HomeViewController {
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
        guard let url = URL(string: Config.baseURL + "/notice/list") else { return }
        
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
                let noticeData = try decoder.decode(NoticesResponse.self, from: data)
                
                DispatchQueue.main.async {
                    self.bindNoticeCell(notices: noticeData)
                    completion(true)
                }
            } catch {
                print("Failed to parse JSON: \(error)")
                completion(false)
            }
        }.resume()
    }
    
    private func bindNoticeCell(notices: NoticesResponse) {
        let noticeList = notices.notices
        if let lastNotice = noticeList.last?.content {
            DispatchQueue.main.async {
                self.noticeContentLabel.text = lastNotice
            }
        }
    }
}


