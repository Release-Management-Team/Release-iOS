//
//  ManageCreateNoticeView.swift
//  Release-iOS
//
//  Created by 신지원 on 3/23/25.
//

import UIKit

import SnapKit
import Then

final class ManageCreateNoticeView: UIView {
    
    //MARK: - UI Components
    
    var noticeTitleTextField = UITextField()
    var noticeContentTextView = UITextView()
    private let noticeImportantLabel = UILabel()
    let noticeImportantSwitch = UISwitch()
    let changeButton = UIButton()
    
    let backButton = UIButton()
    
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
        
        noticeTitleTextField.do {
            $0.placeholder = "공지 제목"
            $0.textColor = .gray5
            $0.layer.cornerRadius = 16
            $0.backgroundColor = .black2
            
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 24, height: $0.frame.height))
            $0.leftView = paddingView
            $0.leftViewMode = .always
            $0.layer.borderColor = UIColor.primary4.cgColor
            $0.layer.borderWidth = 0
        }
        
        noticeContentTextView.do {
            $0.textColor = .gray5
            $0.font = .paragraph2
            $0.backgroundColor = .black2
            $0.layer.cornerRadius = 16
            $0.layer.borderColor = UIColor.primary4.cgColor
            $0.layer.borderWidth = 0
            $0.textContainerInset = UIEdgeInsets(top: 12, left: 16, bottom: 12, right: 16)
        }
        
        noticeImportantLabel.do {
            $0.text = "메인 화면에 등록하기"
            $0.textColor = .gray5
            $0.font = .paragraph3
        }
        
        noticeImportantSwitch.do {
            $0.onTintColor = .primary1
            $0.thumbTintColor = .white
            $0.backgroundColor = .black3
            $0.layer.cornerRadius = 16
        }
        
        changeButton.do {
            $0.backgroundColor = .primary1
            $0.setTitleColor(.black1, for: .normal)
            $0.setTitle(StringLiterals.Manage.postNotice, for: .normal)
            $0.titleLabel?.font = .heading4
            $0.layer.cornerRadius = 16
        }
        
        backButton.do {
            $0.setImage(.icArrow, for: .normal)
        }
    }
    
    private func setHierarchy() {
        [noticeTitleTextField,
         noticeContentTextView,
         noticeImportantLabel,
         noticeImportantSwitch,
         changeButton].forEach {
            addSubview($0)
        }
    }
    
    private func setLayout() {
        noticeTitleTextField.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(40)
            $0.leading.trailing.equalToSuperview().inset(24)
            $0.height.equalTo(48)
        }
        
        noticeContentTextView.snp.makeConstraints {
            $0.top.equalTo(noticeTitleTextField.snp.bottom).offset(25)
            $0.leading.trailing.equalToSuperview().inset(24)
            $0.height.equalTo(100)
        }
        
        noticeImportantLabel.snp.makeConstraints {
            $0.top.equalTo(noticeContentTextView.snp.bottom).offset(20)
            $0.leading.equalToSuperview().inset(30)
        }
        
        noticeImportantSwitch.snp.makeConstraints {
            $0.centerY.equalTo(noticeImportantLabel)
            $0.leading.equalTo(noticeImportantLabel.snp.trailing).offset(20)
        }
        
        changeButton.snp.makeConstraints {
            $0.bottom.equalTo(safeAreaLayoutGuide).offset(-10)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(197)
            $0.height.equalTo(55)
        }
        
        backButton.snp.makeConstraints {
            $0.size.equalTo(24)
        }
    }
    
    //MARK: - Custom Method
    
    
}
