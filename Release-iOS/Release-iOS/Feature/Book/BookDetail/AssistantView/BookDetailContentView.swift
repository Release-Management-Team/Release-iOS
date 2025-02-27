//
//  BookDetailContentView.swift
//  Release-iOS
//
//  Created by 신지원 on 2/28/25.
//

import UIKit

import SnapKit
import Then

final class BookDetailContentView: UIView {
    
    //MARK: - UI Components
    
    private let stackView = UIStackView()
    private let bookImageView = UIImageView()
    private let statusLabel = UILabel()
    private let titleLabel = UILabel()
    private let personLabel = UILabel()
    private let tagLabel = UILabel()
    private let paddingView = UIView()
    
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
        self.backgroundColor = .black1

        stackView.do {
            $0.axis = .vertical
            $0.alignment = .leading
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
            $0.font = .heading3
            $0.textColor = .gray1
            $0.numberOfLines = 2
        }
        
        personLabel.do {
            $0.font = .paragraph1
            $0.textColor = .gray3
            $0.numberOfLines = 2
        }
        
        tagLabel.do {
            $0.font = .paragraph1
            $0.textColor = .gray3
            $0.numberOfLines = 1
        }
    }
    
    private func setHierarchy() {
        addSubview(stackView)
        [bookImageView,
         statusLabel,
         titleLabel,
         personLabel,
         tagLabel,
         paddingView].forEach {
            stackView.addArrangedSubview($0)
        }
    }
    
    private func setLayout() {
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        bookImageView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(UIScreen.main.bounds.width)
        }
        
        stackView.setCustomSpacing(32, after: bookImageView)
        statusLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(24)
            $0.height.equalTo(24)
            $0.width.equalTo(68)
        }
        
        stackView.setCustomSpacing(24, after: statusLabel)
        titleLabel.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(24)
        }
        
        stackView.setCustomSpacing(16, after: titleLabel)
        personLabel.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(24)
        }
        
        stackView.setCustomSpacing(16, after: personLabel)
        tagLabel.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(24)
        }
        
        paddingView.snp.makeConstraints {
            $0.top.equalTo(tagLabel.snp.bottom)
            $0.bottom.equalToSuperview()
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
        personLabel.text = book.author
        tagLabel.text = book.tags
    }
}
