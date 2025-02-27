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
    
    //MARK: - Properties
    
    static let identifier = "BookCell"
    
    //MARK: - UI Components
    
    private let cellView = UIView()
    private let bookImageView = UIImageView()
    private let statusLabel = UILabel()
    private let titleLabel = UILabel()
    private let contentLabel = UILabel()
    private let personLabel = UILabel()
    private let tagLabel = UILabel()
    
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
        
        bookImageView.do {
            $0.contentMode = .scaleAspectFit
        }
        
        statusLabel.do {
            $0.font = .paragraph3
            $0.textColor = .black2
            $0.backgroundColor = .primary1
            $0.layer.cornerRadius = 8
            $0.clipsToBounds = true
            $0.textAlignment = .center
        }
        
        titleLabel.do {
            $0.font = .heading4
            $0.textColor = .gray1
            $0.numberOfLines = 2
        }
        
        contentLabel.do {
            $0.font = .paragraph3
            $0.textColor = .gray3
            $0.numberOfLines = 2
        }
        
        personLabel.do {
            $0.font = .paragraph2
            $0.textColor = .gray3
            $0.numberOfLines = 2
        }
        
        tagLabel.do {
            $0.font = .paragraph3
            $0.textColor = .gray3
            $0.numberOfLines = 1
        }
    }
    
    private func setHierarchy() {
        contentView.addSubview(cellView)
        [bookImageView,
         statusLabel,
         titleLabel,
         personLabel,
         tagLabel].forEach {
            cellView.addSubview($0)
        }
    }
    
    private func setLayout() {
        cellView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview().inset(8)
        }
        
        bookImageView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.centerY.equalToSuperview()
            $0.size.equalTo(96)
        }
        
        statusLabel.snp.makeConstraints {
            $0.top.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(24)
            $0.width.equalTo(68)
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
    
    //MARK: - Bind Data
    
    func configure(with book: BookEntity) {
        if book.imageURL == "" {
            bookImageView.image = UIImage(named: "dummyLogo")
        } else {
            bookImageView.kfSetImage(url: book.imageURL)
        }
        
        statusLabel.backgroundColor = book.statusColor
        statusLabel.text = book.statusText
        titleLabel.text = book.title
        contentLabel.text = book.statusText
        personLabel.text = book.author
        tagLabel.text = book.tags
    }
}
