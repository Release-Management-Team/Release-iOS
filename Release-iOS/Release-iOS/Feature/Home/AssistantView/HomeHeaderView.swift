//
//  HomeHeaderView.swift
//  Release-iOS
//
//  Created by 신지원 on 3/22/25.
//

import UIKit

import SnapKit
import Then

final class HomeHeaderView: UIView {
    
    //MARK: - UI Components
    
    private let logoImageView = UIImageView()
    let notificationButton = UIButton()
    private let profileImageView = UIImageView()
    private let combineView = UIView()
    let greetingLabel = UILabel()
    private let noticeLabel = UILabel()
    private let noticeView = UIView()
    let noticeContentLabel = UILabel()
    
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
    }
    
    private func setHierarchy() {
        [logoImageView,
         notificationButton,
         combineView].forEach {
            addSubview($0)
        }
        noticeView.addSubview(noticeContentLabel)
        [greetingLabel,
         noticeLabel,
         noticeView].forEach {
            combineView.addSubview($0)
        }
    }
    
    private func setLayout() {
        logoImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(12)
            $0.leading.equalToSuperview().inset(25)
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
            $0.bottom.equalToSuperview()
        }
        
        greetingLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
        }
        
        noticeLabel.snp.makeConstraints {
            $0.top.equalTo(greetingLabel.snp.bottom).offset(40)
            $0.leading.equalToSuperview()
        }
        
        noticeView.snp.makeConstraints {
            $0.top.equalTo(noticeLabel.snp.bottom).offset(8)
            $0.height.equalTo(60)
            $0.leading.trailing.bottom.equalToSuperview()
            
            noticeContentLabel.snp.makeConstraints {
                $0.center.equalToSuperview()
            }
        }
    }
}
