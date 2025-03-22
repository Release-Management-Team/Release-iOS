//
//  ActivityDetailContentView.swift
//  Release-iOS
//
//  Created by 신지원 on 3/22/25.
//

import UIKit

import SnapKit
import Then

final class ActivityDetailContentView: UIView {
    
    //MARK: - UI Components
    
    private let stackView = UIStackView()
    private let contentView = UIView()
    private let activityImageView = UIImageView()
    private let categoryLabel = UILabel()
    private let statusLabel = UILabel()
    private let titleLabel = UILabel()
    private let contentLabel = UILabel()
    private let personLabel = UILabel()
    private let descriptionLabel = UILabel()
    
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
        
        stackView.do {
            $0.axis = .vertical
            $0.alignment = .fill
            $0.spacing = 0
        }
        
        contentView.do {
            $0.backgroundColor = .black1
        }
        
        activityImageView.do {
            $0.image = .dummyLogo
            $0.contentMode = .scaleAspectFit
        }
        
        categoryLabel.do {
            $0.text = "프로젝트"
            $0.font = UIFont.paragraph2
            $0.textColor = .gray5
        }
        
        statusLabel.do {
            $0.font = UIFont.paragraph3
            $0.textColor = .black2
            $0.layer.cornerRadius = 8
            $0.clipsToBounds = true
            $0.textAlignment = .center
        }
        
        titleLabel.do {
            $0.font = UIFont.heading3
            $0.textColor = .gray1
        }
        
        contentLabel.do {
            $0.font = UIFont.paragraph1
            $0.textColor = .gray3
            $0.numberOfLines = 0
        }
        
        personLabel.do {
            $0.font = UIFont.paragraph1
            $0.textColor = .gray3
        }
        
        descriptionLabel.do {
            $0.font = UIFont.paragraph1
            $0.textColor = .gray5
            $0.numberOfLines = 0
        }
    }
    
    private func setHierarchy() {
        [activityImageView,
         contentView].forEach {
            stackView.addArrangedSubview($0)
        }
        
        [categoryLabel,
         statusLabel,
         titleLabel,
         contentLabel,
         personLabel,
         descriptionLabel].forEach {
            contentView.addSubview($0)
        }
    }
    
    private func setLayout() {
        stackView.snp.makeConstraints {
            $0.top.leading.trailing.bottom.equalToSuperview()
        }
        
        activityImageView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(activityImageView.snp.width).priority(.high)
        }
        
        contentView.snp.makeConstraints() {
            $0.width.equalToSuperview()
        }
        
        categoryLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(31)
            $0.leading.equalToSuperview().inset(24)
        }
        
        statusLabel.snp.makeConstraints {
            $0.centerY.equalTo(categoryLabel)
            $0.trailing.equalToSuperview().inset(24)
            $0.height.equalTo(24)
            $0.width.greaterThanOrEqualTo(68)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(categoryLabel.snp.bottom).offset(16)
            $0.leading.equalTo(categoryLabel)
            $0.trailing.equalToSuperview().inset(24)
        }
        
        contentLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(8)
            $0.leading.equalTo(titleLabel)
            $0.trailing.equalToSuperview().inset(24)
        }
        
        personLabel.snp.makeConstraints {
            $0.top.equalTo(contentLabel.snp.bottom).offset(32)
            $0.leading.trailing.equalToSuperview().inset(24)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(personLabel.snp.bottom).offset(48)
            $0.leading.trailing.equalToSuperview().inset(24)
        }
    }
    
    //MARK: - Bind Data
    
    func bindData(activity: ActivityEntity) {
        activityImageView.image = .dummyLogo
        titleLabel.text = activity.title
        personLabel.text = activity.leader
        
        if activity.info == .study {
            categoryLabel.text = "스터디"
        } else {
            categoryLabel.text = "프로젝트"
        }

        if activity.state == .recruiting {
            statusLabel.text = "모집 중"
            statusLabel.backgroundColor = .primary1
        } else if activity.state == .beforeRecruit {
            statusLabel.text = "모집 예정"
            statusLabel.backgroundColor = .primary2
        } else if activity.state == .running {
            statusLabel.text = "모집 마감"
            statusLabel.backgroundColor = .primary2
        }
    }
}
