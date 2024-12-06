//
//  ActivityCell.swift
//  Release-iOS
//
//  Created by 신지원 on 11/18/24.
//

import UIKit

import SnapKit
import Then

class ActivityCell: UITableViewCell {
    
    private let cellView = UIView().then {
        $0.backgroundColor = .black2
        $0.layer.cornerRadius = 16
    }
    
    private let activityImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
    }
    
    private let categoryLabel = UILabel().then {
        $0.font = UIFont.paragraph3
        $0.textColor = UIColor.gray5
        $0.numberOfLines = 1
    }
    
    private let statusLabel = UILabel().then {
        $0.font = UIFont.paragraph3
        $0.textColor = UIColor.black2
        $0.backgroundColor = UIColor.primary1
        $0.layer.cornerRadius = 8
        $0.clipsToBounds = true
        $0.textAlignment = .center
        $0.numberOfLines = 1
    }
    
    private let titleLabel = UILabel().then {
        $0.font = UIFont.heading4
        $0.textColor = UIColor.gray1
        $0.numberOfLines = 1
    }
    
    private let contentLabel = UILabel().then {
        $0.font = UIFont.paragraph3
        $0.textColor = UIColor.gray3
        $0.numberOfLines = 1
    }
    
    private let personLabel = UILabel().then {
        $0.font = UIFont.paragraph2
        $0.textColor = UIColor.gray3
        $0.numberOfLines = 1
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = UIColor.black1
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with activity: ActivityDTO) {
//        activityImageView.kfSetImage(url: activity.image)
//        categoryLabel.text = activity.
        titleLabel.text = activity.name
        contentLabel.text = activity.tags.joined(separator: ", ")
        personLabel.text = activity.leader
        
        if activity.state == "recruiting" {
            statusLabel.text = "모집 중"
            statusLabel.backgroundColor = .primary1
        } else if activity.state == "before_recruit" {
            statusLabel.text = "모집 예정"
            statusLabel.backgroundColor = .primary2
        } else if activity.state == "running" {
            statusLabel.text = "모집 마감"
            statusLabel.backgroundColor = .primary2
        }
    }
    
    private func setupLayout() {
        contentView.addSubview(cellView)
        cellView.addSubview(activityImageView)
        cellView.addSubview(categoryLabel)
        cellView.addSubview(statusLabel)
        cellView.addSubview(titleLabel)
        cellView.addSubview(contentLabel)
        cellView.addSubview(personLabel)
        
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
}
