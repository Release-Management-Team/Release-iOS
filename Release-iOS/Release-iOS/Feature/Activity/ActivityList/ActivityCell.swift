//
//  ActivityCell.swift
//  Release-iOS
//
//  Created by 신지원 on 11/18/24.
//

import UIKit

import SnapKit
import Then

final class ActivityCell: UITableViewCell {
    
    //MARK: - Properties
    
    static let identifier = "ActivityCell"
    
    //MARK: - UI Components
    
    private let cellView = UIView()
    private let activityImageView = UIImageView()
    private let categoryLabel = UILabel()
    private let statusLabel = UILabel()
    private let titleLabel = UILabel()
    private let contentLabel = UILabel()
    private let personLabel = UILabel()
    
    //MARK: - Initializer
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUI()
        setHierarchy()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setup UI
    
    private func setUI() {
        contentView.backgroundColor = .black1
        
        cellView.do {
            $0.backgroundColor = .black2
            $0.layer.cornerRadius = 16
        }
        
        activityImageView.do {
            $0.contentMode = .scaleAspectFit
        }
        
        categoryLabel.do {
            $0.font = .paragraph3
            $0.textColor = .gray5
            $0.numberOfLines = 1
        }
        
        statusLabel.do {
            $0.font = .paragraph3
            $0.textColor = .black2
            $0.backgroundColor = .primary1
            $0.layer.cornerRadius = 8
            $0.clipsToBounds = true
            $0.textAlignment = .center
            $0.numberOfLines = 1
        }
        
        titleLabel.do {
            $0.font = .heading4
            $0.textColor = .gray1
            $0.numberOfLines = 1
        }
        
        contentLabel.do {
            $0.font = .paragraph3
            $0.textColor = .gray3
            $0.numberOfLines = 1
        }
        
        personLabel.do {
            $0.font = .paragraph2
            $0.textColor = .gray3
            $0.numberOfLines = 1
        }
    }
    
    private func setHierarchy() {
        contentView.addSubview(cellView)
        [activityImageView,
         categoryLabel,
         statusLabel,
         titleLabel,
         contentLabel,
         personLabel].forEach {
            cellView.addSubview($0)
        }
    }
    
    private func setLayout() {
        cellView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview().inset(8)
        }
        
        activityImageView.snp.makeConstraints { make in
            make.size.equalTo(96)
            make.leading.equalToSuperview().offset(16)
            make.centerY.equalToSuperview()
        }
        
        statusLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(16)
            make.top.equalToSuperview().inset(16)
            make.height.equalTo(24)
            make.width.equalTo(68)
        }
        
        categoryLabel.snp.makeConstraints { make in
            make.leading.equalTo(activityImageView.snp.trailing).offset(16)
            make.centerY.equalTo(statusLabel)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(categoryLabel)
            make.trailing.equalToSuperview().inset(16)
            make.top.equalTo(categoryLabel.snp.bottom).offset(8)
        }
        
        contentLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom)
            make.leading.equalTo(titleLabel)
            make.trailing.equalToSuperview().inset(16)
        }
        
        personLabel.snp.makeConstraints { make in
            make.top.equalTo(contentLabel.snp.bottom).offset(8)
            make.leading.equalTo(categoryLabel)
            make.bottom.equalToSuperview().inset(16)
        }
    }
    
    //MARK: - Bind Data
    
    func configure(with activity: ActivityEntity) {
//        activityImageView.kfSetImage(url: activity.image)
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
