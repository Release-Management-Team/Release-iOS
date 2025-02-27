//
//  BookView.swift
//  Release-iOS
//
//  Created by 신지원 on 2/28/25.
//

import UIKit

import SnapKit
import Then

final class BookView: UIView {
    
    //MARK: - UI Components
    
    var tableView = UITableView()
    private let navigationLabel = UILabel()
    
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

        navigationLabel.do {
            $0.text = StringLiterals.Navigation.book
            $0.font = .heading3
            $0.textColor = .gray1
        }
        
        tableView.do {
            $0.backgroundColor = .black1
            $0.separatorStyle = .none
            $0.showsVerticalScrollIndicator = false
            $0.showsHorizontalScrollIndicator = false
        }
    }
    
    private func setHierarchy() {
        [navigationLabel,
         tableView].forEach {
            addSubview($0)
        }
    }
    
    private func setLayout() {
        navigationLabel.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(19)
            $0.leading.equalToSuperview().inset(24)
        }
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(navigationLabel.snp.bottom).offset(19)
            $0.leading.trailing.equalToSuperview().inset(24)
            $0.bottom.equalToSuperview()
        }
    }
}
