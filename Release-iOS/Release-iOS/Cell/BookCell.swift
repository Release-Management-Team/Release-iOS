//
//  BookCell.swift
//  Release-iOS
//
//  Created by 신지원 on 11/20/24.
//

import UIKit

import SnapKit
import Then

final class BookCell: UITableViewCell {
    
    private let cellView = UIView().then {
        $0.backgroundColor = .black2
        $0.layer.cornerRadius = 16
    }
    
    private let bookImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
    }
    
    private let statusLabel = UILabel().then {
        $0.font = UIFont.paragraph3
        $0.textColor = UIColor.black2
        $0.backgroundColor = UIColor.primary1
        $0.layer.cornerRadius = 8
        $0.clipsToBounds = true
        $0.textAlignment = .center
    }
    
    private let titleLabel = UILabel().then {
        $0.font = UIFont.heading4
        $0.textColor = UIColor.gray1
        $0.numberOfLines = 2
    }
    
    private let contentLabel = UILabel().then {
        $0.font = UIFont.paragraph3
        $0.textColor = UIColor.gray3
        $0.numberOfLines = 2
    }
    
    private let personLabel = UILabel().then {
        $0.font = UIFont.paragraph2
        $0.textColor = UIColor.gray3
    }
    
    private let tagLabel = UILabel().then {
        $0.font = UIFont.paragraph3
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
    
    func configure(with book: BookDTO) {
        if book.image == "" {
            bookImageView.image = UIImage(named: "dummyLogo")
        } else {
            bookImageView.kfSetImage(url: book.image)
        }
        
        let status = book.availability
        if status == "available" {
            statusLabel.text = "대여 가능"
        } else if status == "unavailable" {
            statusLabel.text = "대여 불가"
        } else if status == "rented" {statusLabel.text = "대여 중"
        } else {
            statusLabel.text = ""
        }
        
        statusLabel.backgroundColor = book.availability == "available" ? .primary1 : .primary2
        titleLabel.text = book.title
        personLabel.text = book.author
        tagLabel.text = book.tags.joined(separator: ", ")
    }
    
    private func setupLayout() {
        contentView.addSubview(cellView)
        cellView.addSubview(bookImageView)
        cellView.addSubview(statusLabel)
        cellView.addSubview(titleLabel)
        cellView.addSubview(personLabel)
        cellView.addSubview(tagLabel)
        
        cellView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview().inset(8)
        }
        
        bookImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.centerY.equalToSuperview()
            make.size.equalTo(96)
        }
        
        statusLabel.snp.makeConstraints { make in
            make.top.trailing.equalToSuperview().inset(16)
            make.height.equalTo(24)
            make.width.equalTo(68)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(statusLabel.snp.bottom).offset(8)
            $0.leading.equalTo(bookImageView.snp.trailing).offset(10)
            $0.trailing.equalToSuperview().inset(16)
        }
        
        
        personLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(8)
            $0.leading.equalTo(bookImageView.snp.trailing).offset(10)
            $0.trailing.equalToSuperview().inset(16)
        }
        
        tagLabel.snp.makeConstraints {
            $0.top.equalTo(personLabel.snp.bottom).offset(8)
            $0.leading.equalTo(bookImageView.snp.trailing).offset(10)
            $0.trailing.bottom.equalToSuperview().inset(16)
        }
    }
}
