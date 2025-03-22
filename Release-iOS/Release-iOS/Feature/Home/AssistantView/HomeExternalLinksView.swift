//
//  HomeExternalLinksView.swift
//  Release-iOS
//
//  Created by 신지원 on 3/22/25.
//

import UIKit

import SnapKit
import Then

final class HomeExternalLinksView: UIView {
    
    //MARK: - UI Components
    
    private let linksTitleLabel = UILabel()
    let websiteButton = UIButton()
    let notionButton = UIButton()
    let discordButton = UIButton()
    let eventButton = UIButton()
    
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
        self.do {
            $0.isUserInteractionEnabled = true
        }
        
        linksTitleLabel.do {
            $0.text = StringLiterals.Home.linksTitle
            $0.font = UIFont.heading3
            $0.textColor = .gray1
        }
        
        websiteButton.do {
            $0.backgroundColor = .black1
            $0.setTitle(StringLiterals.Home.website, for: .normal)
            $0.titleLabel?.font = UIFont.heading4
            $0.setTitleColor(.gray1, for: .normal)
            $0.layer.cornerRadius = 8
            $0.layer.borderColor = UIColor.gray1.cgColor
            $0.layer.borderWidth = 0.5
        }
        
        notionButton.do {
            $0.backgroundColor = .black1
            $0.setTitle(StringLiterals.Home.notion, for: .normal)
            $0.titleLabel?.font = UIFont.heading4
            $0.setTitleColor(.gray1, for: .normal)
            $0.layer.cornerRadius = 8
            $0.layer.borderColor = UIColor.gray1.cgColor
            $0.layer.borderWidth = 0.5
        }
        
        discordButton.do {
            $0.backgroundColor = .black1
            $0.setTitle(StringLiterals.Home.discord, for: .normal)
            $0.titleLabel?.font = UIFont.heading4
            $0.setTitleColor(.gray1, for: .normal)
            $0.layer.cornerRadius = 8
            $0.layer.borderColor = UIColor.gray1.cgColor
            $0.layer.borderWidth = 0.5
        }
        
        eventButton.do {
            $0.backgroundColor = .black1
            $0.setTitle("Event", for: .normal)
            $0.titleLabel?.font = UIFont.heading4
            $0.setTitleColor(.primary1, for: .normal)
            $0.layer.cornerRadius = 8
            $0.layer.borderColor = UIColor.primary1.cgColor
            $0.layer.borderWidth = 0.5
        }
    }
    
    private func setHierarchy() {
        [linksTitleLabel,
         websiteButton,
         notionButton,
         discordButton,
         eventButton].forEach {
            addSubview($0)
        }
    }
    
    private func setLayout() {
        linksTitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(40)
            $0.leading.equalToSuperview().inset(24)
        }
        
        websiteButton.snp.makeConstraints {
            $0.top.equalTo(linksTitleLabel.snp.bottom).offset(20)
            $0.leading.equalToSuperview().inset(24)
            $0.width.equalTo(UIScreen.main.bounds.width/2 - 24 - 6)
            $0.height.equalTo(60)
        }
        
        notionButton.snp.makeConstraints {
            $0.top.equalTo(linksTitleLabel.snp.bottom).offset(20)
            $0.trailing.equalToSuperview().inset(24)
            $0.width.equalTo(UIScreen.main.bounds.width/2 - 24 - 6)
            $0.height.equalTo(60)
        }
        
        discordButton.snp.makeConstraints {
            $0.top.equalTo(websiteButton.snp.bottom).offset(10)
            $0.leading.equalToSuperview().inset(24)
            $0.width.equalTo(UIScreen.main.bounds.width/2 - 24 - 6)
            $0.height.equalTo(60)
        }
        
        eventButton.snp.makeConstraints {
            $0.top.equalTo(websiteButton.snp.bottom).offset(10)
            $0.trailing.equalToSuperview().inset(24)
            $0.width.equalTo(UIScreen.main.bounds.width/2 - 24 - 6)
            $0.height.equalTo(60)
        }
    }
}
