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
    
    private let stackView = UIStackView()
    private let contentView = UIView()
    private let backButton = UIButton()
    private let activityImageView = UIImageView()
    private let categoryLabel = UILabel()
    private let statusLabel = UILabel()
    private let titleLabel = UILabel()
    private let contentLabel = UILabel()
    private let personLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let joinButton = UIButton()
    
    init(activity: ActivityDTO) {
        self.activity = activity
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setupLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.isNavigationBarHidden = true
        hideTabBar()
    }
    
    private func setUI() {
        view.backgroundColor = .black1
        
        stackView.do {
            $0.axis = .vertical
            $0.alignment = .fill
            $0.spacing = 0
        }
        
        contentView.do {
            $0.backgroundColor = .black1
        }
        
        backButton.do {
            $0.setImage(.icArrow, for: .normal)
            $0.layer.cornerRadius = 16
            $0.backgroundColor = .gray2.withAlphaComponent(0.7)
        }
        
        activityImageView.do {
            $0.image = UIImage(named: activity.image)
            $0.contentMode = .scaleAspectFit
        }
        
        categoryLabel.do {
            $0.text = activity.category
            $0.font = UIFont.paragraph2
            $0.textColor = .gray5
        }
        
        statusLabel.do {
            $0.text = activity.status
            $0.font = UIFont.paragraph3
            $0.textColor = .black2
            $0.backgroundColor = statusLabel.text == "모집 중" ? .primary1 : .primary2
            $0.layer.cornerRadius = 8
            $0.clipsToBounds = true
            $0.textAlignment = .center
        }
        
        titleLabel.do {
            $0.text = activity.title
            $0.font = UIFont.heading3
            $0.textColor = .gray1
        }
        
        contentLabel.do {
            $0.text = activity.content
            $0.font = UIFont.paragraph1
            $0.textColor = .gray3
            $0.numberOfLines = 0
        }
        
        personLabel.do {
            $0.text = activity.person
            $0.font = UIFont.paragraph1
            $0.textColor = .gray3
        }
        
        descriptionLabel.do {
            $0.text = activity.description
            $0.font = UIFont.paragraph1
            $0.textColor = .gray5
            $0.numberOfLines = 0
        }
        
        joinButton.do {
            $0.setTitle(StringLiterals.Activity.join, for: .normal)
            $0.titleLabel?.font = UIFont.heading4
            $0.backgroundColor = .primary1
            $0.setTitleColor(.black2, for: .normal)
            $0.layer.cornerRadius = 16
            $0.isHidden = statusLabel.text != "모집 중"
        }
    }
    
    
    private func setupLayout() {
        view.backgroundColor = UIColor.black1
        view.addSubview(stackView)
        view.addSubview(backButton)
        
        stackView.addArrangedSubview(activityImageView)
        stackView.addArrangedSubview(contentView)
        
        stackView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.bottom.equalToSuperview()
        }

        activityImageView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(activityImageView.snp.width).priority(.high)
        }
        
        contentView.snp.makeConstraints() {
            $0.width.equalToSuperview()
        }
        
        backButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(13)
            make.leading.equalToSuperview().inset(24)
            make.size.equalTo(48)
        }
    
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        
        if statusLabel.text == "모집 중" {
            view.addSubview(joinButton)
            
            joinButton.snp.makeConstraints { make in
                make.bottom.equalToSuperview()
                make.height.equalTo(55)
                make.width.equalTo(193)
            }
            
            joinButton.addTarget(self, action: #selector(joinButtonTapped), for: .touchUpInside)
            
        }
        
        contentView.addSubview(categoryLabel)
        contentView.addSubview(statusLabel)
        contentView.addSubview(titleLabel)
        contentView.addSubview(contentLabel)
        contentView.addSubview(personLabel)
        contentView.addSubview(descriptionLabel)
        
        
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
        
        contentLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.leading.equalTo(titleLabel)
            make.trailing.equalToSuperview().inset(24)
        }
        
        personLabel.snp.makeConstraints { make in
            make.top.equalTo(contentLabel.snp.bottom).offset(32)
            make.leading.trailing.equalToSuperview().inset(24)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(personLabel.snp.bottom).offset(48)
            $0.leading.trailing.equalToSuperview().inset(24)
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
