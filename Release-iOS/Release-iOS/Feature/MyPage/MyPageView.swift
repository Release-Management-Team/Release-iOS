//
//  MyPageView.swift
//  Release-iOS
//
//  Created by 신지원 on 12/6/24.
//

import UIKit

import SnapKit
import Then

final class MyPageView: UIView {
    
    //MARK: - UI Components
    
    private let navigationLabel = UILabel()
    private let stackView = UIStackView()
    let profileView = MyPageProfileView()
    let myActivityView = MyPageMyActivityView()
    let changeInfoView = MyPageChangeInfoView()
    
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
            $0.text = StringLiterals.Navigation.my
            $0.font = .heading3
            $0.textColor = .gray1
        }
        
        stackView.do {
            $0.axis = .vertical
            $0.spacing = 32
            $0.alignment = .center
            $0.backgroundColor = .black1
        }
    }
    
    private func setHierarchy() {
        [navigationLabel,
         stackView].forEach {
            addSubview($0)
        }
        
        [profileView,
         myActivityView,
         changeInfoView].forEach {
            stackView.addArrangedSubview($0)
        }
    }
    
    private func setLayout() {
        navigationLabel.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide).offset(19)
            $0.leading.equalToSuperview().inset(24)
        }
        
        stackView.snp.makeConstraints {
            $0.top.equalTo(navigationLabel.snp.bottom).offset(19)
            $0.leading.trailing.equalToSuperview()
            
            [profileView,
             myActivityView,
             changeInfoView].forEach {
                $0.snp.makeConstraints {
                    $0.leading.trailing.equalToSuperview().inset(24)
                }
                stackView.setCustomSpacing(32, after: $0)
            }
        }
    }
}
