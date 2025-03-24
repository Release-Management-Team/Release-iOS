//
//  MyPageProfileContentView.swift
//  Release-iOS
//
//  Created by 신지원 on 2/16/25.
//

import UIKit

import SnapKit
import Then

final class MyPageProfileContentView: UIView {
    
    //MARK: - UI Components
    
    private let profileContentView = UIView()
    private let profileNameLabel = UILabel()
    let roleButton = UIButton()
    private let statusMessageLabel = UILabel()
    private let infomationView = MyPageInformationView()
    
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
        
        profileContentView.do {
            $0.backgroundColor = .black2
            $0.layer.borderWidth = 1
            $0.layer.borderColor = UIColor.primary2.cgColor
            $0.layer.cornerRadius = 16
        }
        
        profileNameLabel.do {
            $0.font = .heading3
            $0.textColor = .gray1
        }
        
        roleButton.do {
            $0.setTitle(StringLiterals.My.staff, for: .normal)
            $0.setTitleColor(.primary1, for: .normal)
            $0.titleLabel?.font = .paragraph3
            $0.layer.cornerRadius = 8
            $0.layer.borderWidth = 1
            $0.layer.borderColor = UIColor.primary1.cgColor
            $0.backgroundColor = .clear
            $0.contentEdgeInsets = UIEdgeInsets(top: 8, left: 12, bottom: 8, right: 12)
        }
        
        statusMessageLabel.do {
            $0.text = StringLiterals.My.dummyStatus
            $0.font = .paragraph1
            $0.textColor = .gray3
        }
    }
    
    private func setHierarchy() {
        addSubview(profileContentView)
        [profileNameLabel,
         roleButton,
         statusMessageLabel,
         infomationView].forEach {
            profileContentView.addSubview($0)
        }
    }
    
    private func setLayout() {
        profileContentView.snp.makeConstraints {
            $0.top.leading.trailing.bottom.equalToSuperview()
        }
        
        profileNameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(65)
            $0.leading.equalToSuperview().inset(24)
        }
        
        roleButton.snp.makeConstraints {
            $0.centerY.equalTo(profileNameLabel.snp.centerY)
            $0.leading.equalTo(profileNameLabel.snp.trailing).offset(23)
        }
        
        statusMessageLabel.snp.makeConstraints {
            $0.top.equalTo(profileNameLabel.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview().inset(24)
        }
        
        infomationView.snp.makeConstraints {
            $0.top.equalTo(statusMessageLabel.snp.bottom).offset(24)
            $0.leading.trailing.bottom.equalToSuperview().inset(24)
        }
    }
    
    //MARK: - Bind Data
    
    func bindProfileContentData(data: ProfileContentEntity) {
        profileNameLabel.text = data.name
        statusMessageLabel.text = data.message ?? StringLiterals.My.dummyStatus
        roleButton.isHidden = !data.isExecutive
        infomationView.bindProfileInfomationData(data: data.infomation)
    }
}
