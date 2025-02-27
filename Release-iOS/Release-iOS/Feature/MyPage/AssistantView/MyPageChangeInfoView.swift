//
//  MyPageChangeInfoView.swift
//  Release-iOS
//
//  Created by 신지원 on 2/27/25.
//

import UIKit

import SnapKit
import Then

final class MyPageChangeInfoView: UIView {
    
    //MARK: - UI Components
    
    private let passwordTitle = UILabel()
    let passwordButton = UIButton()
    private let passwordButtonLabel = UILabel()
    private let passwordButtonImageView = UIImageView()
    
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
        backgroundColor = .black1
        
        passwordTitle.do {
            $0.text = StringLiterals.My.edit
            $0.font = .heading4
            $0.textColor = .gray1
        }
        
        passwordButton.do {
            $0.layer.cornerRadius = 16
            $0.layer.backgroundColor = UIColor.black2.cgColor
            
            passwordButtonLabel.do {
                $0.text = StringLiterals.My.passwordEdit
                $0.textColor = .gray3
                $0.font = .paragraph1
                $0.isUserInteractionEnabled = false
            }
            
            passwordButtonImageView.do {
                $0.image = .icRightArrow
                $0.image?.withRenderingMode(.alwaysTemplate).withTintColor(.gray3)
                $0.isUserInteractionEnabled = false
            }
        }
    }
    
    private func setHierarchy() {
        [passwordTitle,
         passwordButton].forEach {
            addSubview($0)
        }
        
        [passwordButtonLabel,
         passwordButtonImageView].forEach {
            passwordButton.addSubview($0)
        }
    }
    
    private func setLayout() {
        passwordTitle.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
        }
        
        passwordButton.snp.makeConstraints {
            $0.top.equalTo(passwordTitle.snp.bottom).offset(8)
            $0.leading.trailing.bottom.equalToSuperview()
            $0.height.equalTo(68)
            
            passwordButtonLabel.snp.makeConstraints {
                $0.leading.equalToSuperview().inset(16)
                $0.centerY.equalToSuperview()
            }
            
            passwordButtonImageView.snp.makeConstraints {
                $0.trailing.equalToSuperview().inset(16)
                $0.centerY.equalToSuperview()
                $0.size.equalTo(24)
            }
        }
    }
}
