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
    
    private let logoImageView = UIImageView(image: UIImage(named: "releaseLogo")).then {
        $0.contentMode = .scaleAspectFit
    }
    
    private let notificationButton = UIButton().then {
        $0.setImage(UIImage(named: "icRing"), for: .normal)
    }
    
    private let profileImageView = UIImageView(image: UIImage(named: "kuromiDummy")).then {
        $0.layer.cornerRadius = 24
        $0.clipsToBounds = true
    }
    
    private let greetingLabel = UILabel().then {
        $0.font = .heading3
        $0.textColor = .gray1
        $0.numberOfLines = 2
        $0.text = "신지원 님,\n오늘도 버그없는 개발 되세요!"
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
        $0.text = "⛔️ 16:00 ~ 18:00  랩실 출입 통제됩니다"
        $0.font = .paragraph1
        $0.textColor = .black2
        $0.textAlignment = .left
    }
    
    private let weeklyLabel = UILabel().then {
        $0.text = StringLiterals.Home.weekly
        $0.font = .heading3
        $0.textColor = .gray1
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .black1
        view.addSubview(logoImageView)
        view.addSubview(notificationButton)
        view.addSubview(profileImageView)
        view.addSubview(greetingLabel)
        view.addSubview(noticeView)
        view.addSubview(noticeLabel)
        noticeView.addSubview(noticeContentLabel)
        view.addSubview(weeklyLabel)
        
        logoImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(12)
            make.leading.equalToSuperview().offset(25)
            make.size.equalTo(CGSize(width: 80, height: 48))
        }
        
        notificationButton.snp.makeConstraints { make in
            make.centerY.equalTo(logoImageView)
            make.trailing.equalTo(profileImageView.snp.leading).offset(-24)
            make.size.equalTo(CGSize(width: 32, height: 32))
        }
        
        profileImageView.snp.makeConstraints { make in
            make.centerY.equalTo(logoImageView)
            make.trailing.equalToSuperview().inset(24)
            make.size.equalTo(CGSize(width: 48, height: 48))
        }
        
        greetingLabel.snp.makeConstraints { make in
            make.top.equalTo(logoImageView.snp.bottom).offset(44)
            make.leading.trailing.equalToSuperview().inset(24)
        }
        
        noticeLabel.snp.makeConstraints { make in
            make.top.equalTo(greetingLabel.snp.bottom).offset(40)
            make.leading.equalToSuperview().offset(24)
        }
        
        noticeView.snp.makeConstraints { make in
            make.top.equalTo(noticeLabel.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(24)
            
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
}
