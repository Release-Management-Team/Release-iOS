//
//  ActivityDetailViewController.swift
//  Release-iOS
//
//  Created by 신지원 on 11/4/24.
//

import UIKit
import SnapKit

final class ActivityDetailViewController: UIViewController {
    
    private let activity: ActivityDTO
    
    private let stackView = UIStackView().then {
        $0.axis = .vertical
    }
    
    private let contentView = UIView().then {
        $0.backgroundColor = .black1
    }
    
    private let backButton = UIButton().then {
        $0.setImage(.icArrow, for: .normal)
        $0.layer.cornerRadius = 16
        $0.backgroundColor = .gray2.withAlphaComponent(0.7)
    }
    
    private let activityImageView = UIImageView(image: UIImage(named: "kuromiDummy")).then {
        $0.contentMode = .scaleAspectFit
    }
    
    private let categoryLabel = UILabel().then {
        $0.font = UIFont.paragraph2
        $0.textColor = UIColor.gray5
    }
    
    private let statusLabel = UILabel().then {
        $0.font = UIFont.paragraph3
        $0.textColor = UIColor.black2
        $0.backgroundColor = UIColor.primary1
        $0.layer.cornerRadius = 8
        $0.clipsToBounds = true
        $0.textAlignment = .center
    }
    
    private let titleLabel = UILabel().then {
        $0.font = UIFont.heading4
        $0.textColor = UIColor.gray1
    }
    
    private let contentLabel = UILabel().then {
        $0.font = UIFont.paragraph1
        $0.textColor = UIColor.gray3
        $0.numberOfLines = 0
    }
    
    private let personLabel = UILabel().then {
        $0.font = UIFont.paragraph1
        $0.textColor = UIColor.gray3
    }
    
    private let joinButton = UIButton().then {
        $0.setTitle(StringLiterals.Activity.join, for: .normal)
        $0.titleLabel?.font = UIFont.heading4
        $0.backgroundColor = UIColor.primary1
        $0.setTitleColor(.black2, for: .normal)
        $0.layer.cornerRadius = 16
    }
    
    init(activity: ActivityDTO) {
        self.activity = activity
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        
        hideTabBar()
        navigationController?.isNavigationBarHidden = true
    }
    
    private func setupLayout() {
        view.backgroundColor = UIColor.black1
        view.addSubview(stackView)
        view.addSubview(joinButton)
        view.addSubview(backButton)
        
        stackView.addArrangedSubview(activityImageView)
        stackView.addArrangedSubview(contentView)
        
        stackView.snp.makeConstraints { make in
            make.top.equalTo(activityImageView.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview()
        }

        activityImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(view.frame.width)
        }
        
        joinButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.height.equalTo(55)
            make.width.equalTo(193)
        }
        
        backButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(13)
            make.leading.equalToSuperview().inset(24)
            make.size.equalTo(48)
        }
        
        joinButton.addTarget(self, action: #selector(joinButtonTapped), for: .touchUpInside)
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        
        contentView.addSubview(categoryLabel)
        contentView.addSubview(statusLabel)
        contentView.addSubview(titleLabel)
        contentView.addSubview(contentLabel)
        contentView.addSubview(personLabel)
        
        
        categoryLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(31)
            make.leading.equalToSuperview().inset(24)
        }
        
        statusLabel.snp.makeConstraints { make in
            make.centerY.equalTo(categoryLabel)
            make.trailing.equalToSuperview().inset(24)
            make.height.equalTo(24)
            make.width.greaterThanOrEqualTo(68)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(categoryLabel.snp.bottom).offset(16)
            make.leading.equalTo(categoryLabel)
            make.trailing.equalToSuperview().inset(24)
        }
        
        personLabel.snp.makeConstraints { make in
            make.top.equalTo(contentLabel.snp.bottom).offset(32)
            make.leading.equalTo(contentLabel)
            make.bottom.equalToSuperview().inset(16)
        }
        
        contentLabel.snp.makeConstraints { make in
            make.top.equalTo(personLabel.snp.bottom).offset(32)
            make.leading.equalTo(titleLabel)
            make.trailing.equalToSuperview().inset(24)
        }
    }
    
    
    @objc private func joinButtonTapped() {
        print("참여하기 버튼 탭")
    }
    
    @objc
    private func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
}
