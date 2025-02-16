//
//  HomeView.swift
//  Release-iOS
//
//  Created by 신지원 on 2/14/25.
//

import UIKit

import SnapKit
import Then

final class HomeView: UIView {
    
    //MARK: - UI Components
    
    private let logoImageView = UIImageView()
    let notificationButton = UIButton()
    private let profileImageView = UIImageView()
    private let combineView = UIView()
    private let greetingLabel = UILabel()
    private let noticeLabel = UILabel()
    private let noticeView = UIView()
    private let noticeContentLabel = UILabel()
    private let weeklyLabel = UILabel()
    
    //MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setHierarchy()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setup UI
    
    private func setUI() {
        self.backgroundColor = .black1
        
        logoImageView.do {
            $0.image = UIImage(named: "releaseLogo")
            $0.contentMode = .scaleAspectFit
        }
        
        notificationButton.do {
            $0.setImage(.icRing, for: .normal)
        }
        
        profileImageView.do {
            $0.image = UIImage(named: "releaseLogo")
            $0.layer.cornerRadius = 24
            $0.clipsToBounds = true
        }
        
        combineView.do {
            $0.backgroundColor = .clear
        }
        
        greetingLabel.do {
            $0.font = .heading3
            $0.textColor = .gray1
            $0.numberOfLines = 2
            $0.text = "행복한 하루 🧑🏻‍💻\n오늘도 버그없는 개발 되세요!"
        }
        
        noticeLabel.do {
            $0.text = StringLiterals.Home.notice
            $0.font = .heading3
            $0.textColor = .primary1
        }
        
        noticeView.do {
            $0.backgroundColor = .primary1
            $0.layer.cornerRadius = 16
        }
        
        noticeContentLabel.do {
            $0.font = .paragraph1
            $0.textColor = .black2
            $0.textAlignment = .left
        }
        
        weeklyLabel.do {
            $0.text = StringLiterals.Home.weekly
            $0.font = .heading3
            $0.textColor = .gray1
            $0.isHidden = true
        }
    }
    
    private func setHierarchy() {
        [logoImageView,
         notificationButton,
         combineView,
         weeklyLabel].forEach {
            addSubview($0)
        }
        
        [greetingLabel,
         noticeView,
         noticeLabel].forEach {
            combineView.addSubview($0)
        }
        
        noticeView.addSubview(noticeContentLabel)
    }
    
    private func setLayout() {
        logoImageView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(12)
            $0.leading.equalToSuperview().offset(25)
            $0.size.equalTo(CGSize(width: 80, height: 48))
        }
        
        notificationButton.snp.makeConstraints {
            $0.centerY.equalTo(logoImageView)
            $0.trailing.equalToSuperview().inset(24)
            $0.size.equalTo(CGSize(width: 32, height: 32))
        }
        
        combineView.snp.makeConstraints {
            $0.top.equalTo(logoImageView.snp.bottom).offset(50)
            $0.leading.trailing.equalToSuperview().inset(24)
        }
        
        greetingLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
        }
        
        noticeLabel.snp.makeConstraints {
            $0.top.equalTo(greetingLabel.snp.bottom).offset(40)
            $0.bottom.leading.equalToSuperview()
        }
        
        noticeView.snp.makeConstraints {
            $0.top.equalTo(noticeLabel.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview()
            
            noticeContentLabel.snp.makeConstraints {
                $0.top.bottom.equalToSuperview().inset(24)
                $0.leading.trailing.equalToSuperview().inset(16)
            }
        }
        
        weeklyLabel.snp.makeConstraints {
            $0.top.equalTo(noticeView.snp.bottom).offset(32)
            $0.leading.equalToSuperview().offset(24)
        }
    }
    
    //MARK: - Bind Data
    
    func bindNoticeData(lastNotice: String) {
        noticeContentLabel.text = lastNotice
    }
    
    func setupGreetingLabel() {
        let currentHour = Calendar.current.component(.hour, from: Date())
        
        let selectedMessage: String
        if currentHour >= 5 && currentHour < 12 {
            selectedMessage = morningMessages.randomElement() ?? "좋은 아침입니다! ☀️"
        } else if currentHour >= 1 && currentHour < 5 {
            selectedMessage = dawnMessages.randomElement() ?? "이 시간까지 깨어있다니… 🤯"
        } else {
            selectedMessage = defaultmMssages.randomElement() ?? "오늘도 좋은 하루 보내세요! 😊"
        }
        
        greetingLabel.text = selectedMessage
    }
}
