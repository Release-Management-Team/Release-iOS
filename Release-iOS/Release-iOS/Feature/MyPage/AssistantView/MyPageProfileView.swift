//
//  MyPageProfileView.swift
//  Release-iOS
//
//  Created by 신지원 on 2/16/25.
//

import UIKit

import SnapKit
import Then

final class MyPageProfileView: UIView {
    
    //MARK: - UI Components
    
    private let profileImageView = UIImageView()
    let profileContentView = MyPageProfileContentView()
    
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
        
        profileImageView.do {
            $0.image = .dummyLogo
            $0.layer.masksToBounds = true
            $0.layer.cornerRadius = 96/2
        }
    }
    
    private func setHierarchy() {
        [profileContentView,
         profileImageView].forEach {
            addSubview($0)
        }
    }
    
    private func setLayout() {
        profileContentView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(50)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
        profileImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(16)
            $0.leading.equalToSuperview().inset(8)
            $0.size.equalTo(96)
        }
    }
    
    //MARK: - Bind Data
    
    func bindProfileData(data: ProfileEntity) {
//        profileImageView.image = data.image
        profileContentView.bindProfileContentData(data: data.contentEntity)
    }
}
