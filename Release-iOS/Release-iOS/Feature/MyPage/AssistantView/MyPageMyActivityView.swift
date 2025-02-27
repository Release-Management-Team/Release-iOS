//
//  MyPageMyActivityView.swift
//  Release-iOS
//
//  Created by 신지원 on 2/28/25.
//

import UIKit

import SnapKit
import Then

final class MyPageMyActivityView: UIView {
    
    //MARK: - UI Components
    
    private let myActivityTitle = UILabel()
    let myActivityButton = UIButton()
    private let myActivityButtonLabel = UILabel()
    private let myActivityButtonImageView = UIImageView()
    
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
        
        myActivityTitle.do {
            $0.text = StringLiterals.My.check
            $0.font = .heading4
            $0.textColor = .gray1
        }
        
        myActivityButton.do {
            $0.layer.cornerRadius = 16
            $0.layer.backgroundColor = UIColor.primary1.cgColor
            
            myActivityButtonLabel.do {
                $0.text = StringLiterals.My.bookCheck
                $0.textColor = .black2
                $0.font = .paragraph1
                $0.isUserInteractionEnabled = false
            }
            
            myActivityButtonImageView.do {
                $0.image = .icRightArrow.withRenderingMode(.alwaysTemplate).withTintColor(.black2)
                $0.isUserInteractionEnabled = false
            }
        }
    }
    
    private func setHierarchy() {
        [myActivityTitle,
         myActivityButton].forEach {
            addSubview($0)
        }
        
        [myActivityButtonLabel,
         myActivityButtonImageView].forEach {
            myActivityButton.addSubview($0)
        }
    }
    
    private func setLayout() {
        myActivityTitle.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
        }
        
        myActivityButton.snp.makeConstraints {
            $0.top.equalTo(myActivityTitle.snp.bottom).offset(8)
            $0.leading.trailing.bottom.equalToSuperview()
            $0.height.equalTo(68)
            
            myActivityButtonLabel.snp.makeConstraints {
                $0.leading.equalToSuperview().inset(16)
                $0.centerY.equalToSuperview()
            }
            
            myActivityButtonImageView.snp.makeConstraints {
                $0.trailing.equalToSuperview().inset(16)
                $0.centerY.equalToSuperview()
                $0.size.equalTo(24)
            }
        }
    }
}
