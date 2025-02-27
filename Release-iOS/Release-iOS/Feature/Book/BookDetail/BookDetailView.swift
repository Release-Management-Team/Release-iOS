//
//  BookDetailView.swift
//  Release-iOS
//
//  Created by 신지원 on 2/28/25.
//

import UIKit

import SnapKit
import Then

final class BookDetailView: UIView {
    
    //MARK: - UI Components
    
    let bookContentView = BookDetailContentView()
    let backButton = UIButton()
    private let borrowBottomSheet = UIView()
    let borrowButton = UIButton()
    
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

        backButton.do {
            $0.setImage(.icArrow, for: .normal)
            $0.layer.cornerRadius = 16
            $0.backgroundColor = .gray2.withAlphaComponent(0.7)
        }
        
        borrowBottomSheet.do {
            $0.backgroundColor = .black2
            $0.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
            $0.layer.cornerRadius = 16
        }
        
        borrowButton.do {
            $0.setTitle(StringLiterals.Book.unavaliable, for: .normal)
            $0.setTitleColor(.black2, for: .normal)
            $0.backgroundColor = .black1
            $0.layer.cornerRadius = 16
        }
    }
    
    private func setHierarchy() {
        [bookContentView,
         backButton,
         borrowBottomSheet].forEach {
            addSubview($0)
        }
        borrowBottomSheet.addSubview(borrowButton)
    }
    
    private func setLayout() {
        bookContentView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(borrowBottomSheet.snp.top).offset(-37)
        }
        
        backButton.snp.makeConstraints {
            $0.top.equalTo(bookContentView.snp.top).offset(13)
            $0.leading.equalTo(bookContentView.snp.leading).offset(24)
            $0.size.equalTo(48)
        }
        
        borrowBottomSheet.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview()
            $0.height.equalTo(114)
            
            borrowButton.snp.makeConstraints {
                $0.centerX.equalToSuperview()
                $0.top.equalToSuperview().inset(13)
                $0.height.equalTo(55)
                $0.width.equalTo(201)
            }
        }
    }
    
    //MARK: - Bind Data
    
    func isBorrowable(buttonLabelText: String, isAbled: Bool) {
        borrowButton.setTitle(buttonLabelText, for: .normal)
        borrowButton.backgroundColor = isAbled ? .primary1 : .black1
        borrowButton.isEnabled = isAbled
    }
}
