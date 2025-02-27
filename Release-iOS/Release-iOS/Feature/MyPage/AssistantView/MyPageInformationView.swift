//
//  MyPageInformationView.swift
//  Release-iOS
//
//  Created by 신지원 on 2/16/25.
//

import UIKit

import SnapKit
import Then

final class MyPageInformationView: UIView {
    
    //MARK: - UI Components
    
    private let titleView = UIStackView()
    private let studentNumberTitleLabel = UILabel()
    private let majorTitleLabel = UILabel()
    private let periodTitleLabel = UILabel()
    private let emailTitleLabel = UILabel()
    private let phoneTitleLabel = UILabel()
    
    private let infomationView = UIStackView()
    private let studentNumberLabel = UILabel()
    private let majorLabel = UILabel()
    private let periodLabel = UILabel()
    private let emailLabel = UILabel()
    private let phoneLabel = UILabel()
    
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
        self.backgroundColor = .black2
        
        titleView.do {
            $0.axis = .vertical
            $0.spacing = 12
            $0.alignment = .leading
            
            studentNumberTitleLabel.do {
                $0.text = StringLiterals.My.studentNumber
                $0.font = .paragraph2
                $0.textColor = .gray3
            }
            
            majorTitleLabel.do {
                $0.text = StringLiterals.My.major
                $0.font = .paragraph2
                $0.textColor = .gray3
                $0.numberOfLines = 1
            }
            
            periodTitleLabel.do {
                $0.text = StringLiterals.My.period
                $0.font = .paragraph2
                $0.textColor = .gray3
                $0.numberOfLines = 1
            }
            
            emailTitleLabel.do {
                $0.text = StringLiterals.My.email
                $0.font = .paragraph2
                $0.textColor = .gray3
                $0.numberOfLines = 1
            }
            
            phoneTitleLabel.do {
                $0.text = StringLiterals.My.phone
                $0.font = .paragraph2
                $0.textColor = .gray3
                $0.numberOfLines = 1
            }
        }
        
        infomationView.do {
            $0.axis = .vertical
            $0.spacing = 12
            $0.alignment = .leading
            
            studentNumberLabel.do {
                $0.text = StringLiterals.My.dummyStudentNumber
                $0.font = .paragraph2
                $0.textColor = .gray5
            }
            
            majorLabel.do {
                $0.text = StringLiterals.My.dummyMajor
                $0.font = .paragraph2
                $0.textColor = .gray5
            }
            
            periodLabel.do {
                $0.text = StringLiterals.My.dummyPeriod
                $0.font = .paragraph2
                $0.textColor = .gray5
            }
            
            emailLabel.do {
                $0.text = StringLiterals.My.dummyEmail
                $0.font = .paragraph2
                $0.textColor = .gray5
            }
            
            phoneLabel.do {
                $0.text = StringLiterals.My.dummyPhone
                $0.font = .paragraph2
                $0.textColor = .gray5
            }
        }
    }
    
    private func setHierarchy() {
        [titleView,
         infomationView].forEach {
            addSubview($0)
        }
        
        [studentNumberTitleLabel,
         majorTitleLabel,
         periodTitleLabel,
         emailTitleLabel,
         phoneTitleLabel].forEach {
            titleView.addArrangedSubview($0)
        }
        
        [studentNumberLabel,
         majorLabel,
         periodLabel,
         emailLabel,
         phoneLabel].forEach {
            infomationView.addArrangedSubview($0)
        }
    }
    
    private func setLayout() {
        titleView.snp.makeConstraints {
            $0.top.leading.bottom.equalToSuperview()
        }
        
        infomationView.snp.makeConstraints {
            $0.leading.equalTo(titleView.snp.trailing).offset(20)
            $0.top.bottom.equalToSuperview()
        }
    }
    
    //MARK: - Bind Data
    
    func bindProfileInfomationData(data: ProfileInfomationEntity) {
        studentNumberLabel.text = data.id
        majorLabel.text = data.department
        
        let status = data.state
        periodLabel.text = data.joined_semester + "~ " + status
        emailLabel.text = data.email
        phoneLabel.text = data.phone
    }
}
