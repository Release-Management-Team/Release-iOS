//
//  EventCell.swift
//  Release-iOS
//
//  Created by 신지원 on 11/18/24.
//

import UIKit

import SnapKit

class EventCell: UITableViewCell {
    
    //MARK: - UI Components
    
    private let containerView = UIView()
    private let titleLabel = UILabel()
    private let timeLabel = UILabel()
    private let locationLabel = UILabel()
    private let descriptionLabel = UILabel()
    
    //MARK: - Initializer
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Configure Cell
    
    func configure(title: String, time: String, location: String, description: String) {
        titleLabel.text = title
        timeLabel.text = time
        locationLabel.text = location
        descriptionLabel.text = description
    }
    
    //MARK: - Setup UI
    
    private func setupUI() {
        contentView.backgroundColor = .black1
        contentView.addSubview(containerView)
        
        containerView.backgroundColor = .black2
        containerView.layer.cornerRadius = 16
        containerView.layer.masksToBounds = true
        
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
        
        descriptionLabel.do {
            $0.font = .paragraph2
            $0.textColor = .gray5
            $0.numberOfLines = 2
        }
        
        containerView.addSubview(titleLabel)
        containerView.addSubview(timeLabel)
        containerView.addSubview(locationLabel)
        containerView.addSubview(descriptionLabel)
    }
    
    //MARK: - Setup Layout
    
    private func setupLayout() {
        containerView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview().inset(8)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(12)
            make.leading.equalToSuperview().inset(16)
        }
        
        locationLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.leading.equalToSuperview().inset(16)
        }
        
        timeLabel.snp.makeConstraints { make in
            make.top.equalTo(locationLabel.snp.bottom).offset(8)
            make.leading.equalToSuperview().inset(16)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(timeLabel.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().inset(12)
        }
    }
    
    func configure(with data: EventDTO) {
        titleLabel.text = data.name
        descriptionLabel.text = data.description
        var start_time = ""
        var end_time = ""
        if let formattedStartDate = convertDate(data.start_time) {
            start_time = formattedStartDate
        }
        if let formattedEndDate = convertDate(data.end_time) {
            end_time = formattedEndDate
        }
        
        timeLabel.text = start_time + " ~ " + end_time
        locationLabel.text = data.place
    }
    
    private func convertDate(_ dateString: String) -> String? {
        let isoFormatter = ISO8601DateFormatter()
        isoFormatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
        
        if let date = isoFormatter.date(from: dateString) {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
            dateFormatter.locale = Locale(identifier: "ko_KR")
            dateFormatter.timeZone = TimeZone(identifier: "Asia/Seoul")
            
            return dateFormatter.string(from: date)
        }
        
        return nil
    }
}
