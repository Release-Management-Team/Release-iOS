//
//  EventCell.swift
//  Release-iOS
//
//  Created by 신지원 on 11/18/24.
//

import UIKit

import SnapKit
import Then

final class EventCell: UITableViewCell {
    
    //MARK: - Properties
    
    static let identifier = "EventCell"
    
    //MARK: - UI Components
    
    private let containerView = UIView()
    private let titleLabel = UILabel()
    private let timeLabel = UILabel()
    private let locationLabel = UILabel()
    private let descriptionLabel = UILabel()
    
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
        
        containerView.do {
            $0.backgroundColor = .black2
            $0.layer.cornerRadius = 16
            $0.layer.masksToBounds = true
        }
        
        titleLabel.do {
            $0.font = .heading4
            $0.textColor = .gray1
        }
        
        timeLabel.do {
            $0.font = .paragraph2
            $0.textColor = .gray3
        }
        
        locationLabel.do {
            $0.font = .paragraph2
            $0.textColor = .gray3
        }
    }
    
    private func setHierarchy() {
        contentView.addSubview(containerView)
        
        [titleLabel,
         timeLabel,
         locationLabel].forEach {
            containerView.addSubview($0)
        }
    }
    
    private func setLayout() {
        containerView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview().inset(8)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(12)
            $0.leading.equalToSuperview().inset(16)
        }
        
        locationLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(8)
            $0.leading.equalToSuperview().inset(16)
        }
        
        timeLabel.snp.makeConstraints {
            $0.top.equalTo(locationLabel.snp.bottom).offset(8)
            $0.leading.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview().inset(12)
        }
    }
    
    //MARK: - Bind Data
    
    func configure(with data: EventEntity) {
        titleLabel.text = data.title
        timeLabel.text = data.start_time
        locationLabel.text = data.place
    }
}
