//
//  ActivityView.swift
//  Release-iOS
//
//  Created by 신지원 on 2/27/25.
//

import UIKit

import SnapKit
import Then

final class ActivityView: UIView {
    
    //MARK: - UI Components
    
    let segmentedControl = UISegmentedControl(items: [
        StringLiterals.Activity.study,
        StringLiterals.Activity.event
    ])
    
    let tableView = UITableView()
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
        backgroundColor = .black1
        
        segmentedControl.do {
            $0.selectedSegmentIndex = 0
            $0.selectedSegmentTintColor = .primary1
            
            let normalAttributes: [NSAttributedString.Key: Any] = [
                .foregroundColor: UIColor.gray5,
                .font: UIFont.heading4
            ]
            $0.setTitleTextAttributes(normalAttributes, for: .normal)
            
            let selectedAttributes: [NSAttributedString.Key: Any] = [
                .foregroundColor: UIColor.black1,
                .font: UIFont.heading4
            ]
            $0.setTitleTextAttributes(selectedAttributes, for: .selected)
        }
        
        navigationLabel.do {
            $0.text = StringLiterals.Navigation.activity
            $0.font = .heading3
            $0.textColor = .gray1
        }
        
        tableView.do {
            $0.backgroundColor = .black1
            $0.separatorStyle = .none
            $0.showsVerticalScrollIndicator = true
        }
    }
    
    private func setHierarchy() {
        [navigationLabel,
         segmentedControl,
         tableView].forEach {
            addSubview($0)
        }
    }
    
    private func setLayout() {
        navigationLabel.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(19)
            $0.leading.equalToSuperview().inset(24)
        }
        
        segmentedControl.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(24)
            $0.top.equalTo(navigationLabel.snp.bottom).offset(19)
            $0.height.equalTo(40)
        }
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(segmentedControl.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview()
        }
    }
}
