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
    
    //MARK: - Properties
    
    static let identifier = "NoticeCell"
    
    //MARK: - UI Components
    
    private let cellView = UIView()
    private let titleLabel = UILabel()
    private let contentLabel = UILabel()
    private let dateLabel = UILabel()
    
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
        contentView.backgroundColor = UIColor.black1
        
        cellView.do {
            $0.backgroundColor = .black2
            $0.layer.cornerRadius = 16
        }
        
        titleLabel.do {
            $0.font = .heading4
            $0.textColor = .gray1
            $0.numberOfLines = 1
        }
        
        contentLabel.do {
            $0.font = .paragraph2
            $0.textColor = .gray1
            $0.numberOfLines = 1
        }
        
        dateLabel.do {
            $0.font = .paragraph2
            $0.textColor = .gray5
            $0.numberOfLines = 1
        }
    }
    
    private func setHierarchy() {
        contentView.addSubview(cellView)
        [titleLabel,
         contentLabel,
         dateLabel].forEach {
            cellView.addSubview($0)
        }
    }
    
    private func setLayout() {
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
    
    //MARK: - Bind Data
    
    func configure(with notice: NoticeDTO) {
        titleLabel.text = notice.title
        contentLabel.text = notice.content
        
        let formattedDate = convertDate(notice.date)
        dateLabel.text = formattedDate
    }
}
