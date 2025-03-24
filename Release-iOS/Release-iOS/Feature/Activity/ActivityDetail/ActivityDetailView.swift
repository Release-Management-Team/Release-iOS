//
//  ActivityDetailView.swift
//  Release-iOS
//
//  Created by 신지원 on 3/22/25.
//

import UIKit

import SnapKit
import Then

final class ActivityDetailView: UIView {
    
    //MARK: - UI Components
    
    private let activityDetailContentView = ActivityDetailContentView()
    let backButton = UIButton()
    let joinButton = UIButton()
    
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
        
        backButton.do {
            $0.setImage(.icArrow, for: .normal)
            $0.layer.cornerRadius = 16
            $0.backgroundColor = .gray2.withAlphaComponent(0.7)
        }
        
        joinButton.do {
            $0.setTitle(StringLiterals.Activity.join, for: .normal)
            $0.titleLabel?.font = UIFont.heading4
            $0.backgroundColor = .primary1
            $0.setTitleColor(.black2, for: .normal)
            $0.layer.cornerRadius = 16
            $0.isEnabled = false
        }
    }
    
    private func setHierarchy() {
        [activityDetailContentView,
         backButton,
         joinButton].forEach {
            addSubview($0)
        }
    }
    
    private func setLayout() {
        activityDetailContentView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
        backButton.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(13)
            $0.leading.equalToSuperview().inset(24)
            $0.size.equalTo(48)
        }
        
        joinButton.snp.makeConstraints {
            $0.bottom.equalTo(safeAreaLayoutGuide).offset(10)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(55)
            $0.width.equalTo(193)
        }
    }
    
    //MARK: - Bind Data
    
    func bindData(activity: ActivityDetailEntity) {
        joinButton.isHidden = activity.state != .running
        activityDetailContentView.bindData(activity: activity)
    }
}
