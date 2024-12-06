//
//  NoticeCell.swift
//  Release-iOS
//
//  Created by 신지원 on 11/20/24.
//

import UIKit

import SnapKit
import Then

final class NoticeCell: UITableViewCell {
    
    private let cellView = UIView().then {
        $0.backgroundColor = .black2
        $0.layer.cornerRadius = 16
    }
    
    private let titleLabel = UILabel().then {
        $0.font = UIFont.heading4
        $0.textColor = UIColor.gray1
        $0.numberOfLines = 1
    }
    
    private let contentLabel = UILabel().then {
        $0.font = UIFont.paragraph2
        $0.textColor = UIColor.gray1
        $0.numberOfLines = 1
    }
    
    private let dateLabel = UILabel().then {
        $0.font = UIFont.paragraph2
        $0.textColor = UIColor.gray5
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = UIColor.black1
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with notice: NoticeDTO) {
        titleLabel.text = notice.title
        contentLabel.text = notice.content
        
        if let formattedDate = convertDate(notice.date) {
            dateLabel.text = formattedDate
        }
    }
    
    private func setupLayout() {
        contentView.addSubview(cellView)
        cellView.addSubview(titleLabel)
        cellView.addSubview(contentLabel)
        cellView.addSubview(dateLabel)
        
        cellView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.bottom.equalToSuperview().inset(8)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(12)
            $0.leading.trailing.equalToSuperview().inset(16)
        }
        
        contentLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview().inset(16)
        }
        
        dateLabel.snp.makeConstraints {
            $0.top.equalTo(contentLabel.snp.bottom).offset(8)
            $0.trailing.equalToSuperview().inset(16)
        }
    }
    
    private func convertDate(_ dateString: String) -> String? {
        let isoFormatter = ISO8601DateFormatter()
        isoFormatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
        
        if let date = isoFormatter.date(from: dateString) {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy년 MM월 dd일 HH:mm"
            dateFormatter.locale = Locale(identifier: "ko_KR")
            dateFormatter.timeZone = TimeZone(identifier: "Asia/Seoul")
            
            return dateFormatter.string(from: date)
        }
        
        return nil
    }
}



