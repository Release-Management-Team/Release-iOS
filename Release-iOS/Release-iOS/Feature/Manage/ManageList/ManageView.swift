//
//  ManageView.swift
//  Release-iOS
//
//  Created by 신지원 on 3/23/25.
//

import UIKit

import SnapKit
import Then

final class ManageView: UIView {
    
    //MARK: - UI Components
    
    var tableView = UITableView()
    let backButton = UIButton()
    
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
        
        tableView.do {
            $0.backgroundColor = .black1
            $0.separatorStyle = .none
            $0.showsVerticalScrollIndicator = false
            $0.showsHorizontalScrollIndicator = false
            $0.isScrollEnabled = false
        }
        
        backButton.do {
            $0.setImage(.icArrow, for: .normal)
        }
    }
    
    private func setHierarchy() {
        addSubview(tableView)
    }
    
    private func setLayout() {
        tableView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(37)
            $0.leading.trailing.equalToSuperview().inset(24)
            $0.bottom.equalToSuperview()
        }
        
        backButton.snp.makeConstraints {
            $0.size.equalTo(24)
        }
    }
}
