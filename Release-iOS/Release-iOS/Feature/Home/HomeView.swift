//
//  HomeView.swift
//  Release-iOS
//
//  Created by 신지원 on 2/14/25.
//

import UIKit

import SnapKit
import Then

final class HomeView: UIView {
    
    //MARK: - UI Components
    
    let headerView = HomeHeaderView()
    let homeExternalLinkView = HomeExternalLinksView()

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
    }
    
    private func setHierarchy() {
        [headerView,
         homeExternalLinkView].forEach {
            addSubview($0)
        }
    }
    
    private func setLayout() {
        headerView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
        }
        
        homeExternalLinkView.snp.makeConstraints {
            $0.top.equalTo(headerView.snp.bottom).offset(32)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    //MARK: - Bind Data
    
    func bindNoticeData(lastNotice: String) {
        headerView.noticeContentLabel.text = lastNotice
    }
    
    func setupGreetingLabel() {
        let currentHour = Calendar.current.component(.hour, from: Date())
        
        let selectedMessage: String
        if currentHour >= 5 && currentHour < 12 {
            selectedMessage = morningMessages.randomElement() ?? "좋은 아침입니다! ☀️"
        } else if currentHour >= 1 && currentHour < 5 {
            selectedMessage = dawnMessages.randomElement() ?? "이 시간까지 깨어있다니… 🤯"
        } else {
            selectedMessage = defaultmMssages.randomElement() ?? "오늘도 좋은 하루 보내세요! 😊"
        }
        
        headerView.greetingLabel.text = selectedMessage
    }
}
