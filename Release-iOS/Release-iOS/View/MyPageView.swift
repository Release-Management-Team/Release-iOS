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
    
    private let navigationLabel = UILabel()
    
    //마이페이지 정보 칸
    let stackView = UIStackView()
    
    let profileView = UIView()
    var profileImageView = UIImageView()
    
    var profileContentView = UIView()
    var profileNameLabel = UILabel()
    var roleView = UIView()
    var roleLabel = UILabel()
    var statusMessageLabel = UILabel()
    
    var titleView = UIStackView()
    var studentNumberTitleLabel = UILabel()
    var majorTitleLabel = UILabel()
    var periodTitleLabel = UILabel()
    var emailTitleLabel = UILabel()
    var phoneTitleLabel = UILabel()
    
    var infomationView = UIStackView()
    var studentNumberLabel = UILabel()
    var majorLabel = UILabel()
    var periodLabel = UILabel()
    var emailLabel = UILabel()
    var phoneLabel = UILabel()
    
    //정보 수정
    private let changeInfoView = UIView()
    
    private let passwordTitle = UILabel()
    let passwordButton = UIButton()
    private let passwordButtonLabel = UILabel()
    private let passwordButtonImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setHierarchy()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        self.backgroundColor = .black1
        
        navigationLabel.do {
            $0.text = "마이페이지"
            $0.font = .heading3
            $0.textColor = .gray1
        }
        
        stackView.do {
            $0.axis = .vertical
            $0.spacing = 32
            $0.alignment = .center
            $0.backgroundColor = .black1
        }
        
        profileImageView.do {
            $0.image = .dummyLogo
            $0.layer.masksToBounds = true
            $0.layer.cornerRadius = 96/2
        }
        
        profileContentView.do {
            $0.backgroundColor = .black2
            $0.layer.borderWidth = 1
            $0.layer.borderColor = UIColor.primary2.cgColor
            $0.layer.cornerRadius = 16
            
            profileNameLabel.do {
                $0.text = ""
                $0.font = .heading3
                $0.textColor = .gray1
            }
            
            roleView.do {
                $0.layer.cornerRadius = 8
                $0.layer.borderWidth = 1
                $0.layer.borderColor = UIColor.primary1.cgColor
                
                roleLabel.do {
                    $0.text = "임원"
                    $0.font = .paragraph3
                    $0.textColor = .primary1
                }
            }
            
            statusMessageLabel.do {
                $0.text = ""
                $0.font = .paragraph1
                $0.textColor = .gray3
            }
        }
        
        titleView.do {
            $0.axis = .vertical
            $0.spacing = 12
            $0.alignment = .leading
            
            studentNumberTitleLabel.do {
                $0.text = "학번"
                $0.font = .paragraph2
                $0.textColor = .gray3
            }
            
            majorTitleLabel.do {
                $0.text = "학과"
                $0.font = .paragraph2
                $0.textColor = .gray3
                $0.numberOfLines = 1
            }
            
            periodTitleLabel.do {
                $0.text = "가입기간"
                $0.font = .paragraph2
                $0.textColor = .gray3
                $0.numberOfLines = 1
            }
            
            emailTitleLabel.do {
                $0.text = "이메일"
                $0.font = .paragraph2
                $0.textColor = .gray3
                $0.numberOfLines = 1
            }
            
            phoneTitleLabel.do {
                $0.text = "전화번호"
                $0.font = .paragraph2
                $0.textColor = .gray3
                $0.numberOfLines = 1
            }
        }
        
        infomationView.do {
            $0.axis = .vertical
            $0.spacing = 12
            $0.alignment = .leading
            
            studentNumberLabel.do {
                $0.font = .paragraph2
                $0.textColor = .gray5
            }
            
            majorLabel.do {
                $0.font = .paragraph2
                $0.textColor = .gray5
            }
            
            periodLabel.do {
                $0.font = .paragraph2
                $0.textColor = .gray5
            }
            
            emailLabel.do {
                $0.font = .paragraph2
                $0.textColor = .gray5
            }
            
            phoneLabel.do {
                $0.font = .paragraph2
                $0.textColor = .gray5
            }
        }
        
        passwordTitle.do {
            $0.text = "정보 수정"
            $0.font = .heading4
            $0.textColor = .gray1
        }
        
        passwordButton.do {
            $0.layer.cornerRadius = 16
            $0.layer.backgroundColor = UIColor.black2.cgColor
            
            passwordButtonLabel.do {
                $0.text = "비밀번호 변경"
                $0.textColor = .gray3
                $0.font = .paragraph1
                $0.isUserInteractionEnabled = false
            }
            
            passwordButtonImageView.do {
                $0.image = .icRightArrow
                $0.image?.withRenderingMode(.alwaysTemplate).withTintColor(.gray3)
                $0.isUserInteractionEnabled = false
            }
        }
    }
    
    private func setHierarchy() {
        self.addSubviews(navigationLabel,
                         stackView)
        stackView.addArrangedSubviews(profileView,
                                      changeInfoView)
        
        profileView.addSubviews(profileContentView,
                                profileImageView)
        profileContentView.addSubviews(profileNameLabel,
                                       roleView,
                                       statusMessageLabel,
                                       titleView,
                                       infomationView)
        titleView.addArrangedSubviews(studentNumberTitleLabel,
                                      majorTitleLabel,
                                      periodTitleLabel,
                                      emailTitleLabel,
                                      phoneTitleLabel)
        infomationView.addArrangedSubviews(studentNumberLabel,
                                           majorLabel,
                                           periodLabel,
                                           emailLabel,
                                           phoneLabel)
        roleView.addSubview(roleLabel)
        changeInfoView.addSubviews(passwordTitle,
                                   passwordButton)
        passwordButton.addSubviews(passwordButtonLabel,
                                   passwordButtonImageView)
    }
    
    private func setLayout() {
        navigationLabel.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide).offset(19)
            $0.leading.equalToSuperview().inset(24)
        }
        
        stackView.snp.makeConstraints {
            $0.top.equalTo(navigationLabel.snp.bottom).offset(19)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
        profileView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(24)
            
            profileImageView.snp.makeConstraints {
                $0.top.equalToSuperview().inset(16)
                $0.leading.equalToSuperview().inset(8)
                $0.size.equalTo(96)
            }
        }
        
        profileContentView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(56)
            $0.leading.trailing.bottom.equalToSuperview()
            
            profileNameLabel.snp.makeConstraints {
                $0.top.equalToSuperview().inset(65)
                $0.leading.equalToSuperview().inset(24)
            }
            
            roleView.snp.makeConstraints {
                $0.centerY.equalTo(profileNameLabel.snp.centerY)
                $0.leading.equalTo(profileNameLabel.snp.trailing).offset(23)
                
                roleLabel.snp.makeConstraints {
                    $0.top.bottom.equalToSuperview().inset(3)
                    $0.leading.trailing.equalToSuperview().inset(10)
                }
            }
            
            statusMessageLabel.snp.makeConstraints {
                $0.top.equalTo(profileNameLabel.snp.bottom).offset(8)
                $0.leading.trailing.equalToSuperview().inset(24)
            }
        }
        
        titleView.snp.makeConstraints {
            $0.top.equalTo(statusMessageLabel.snp.bottom).offset(24)
            $0.leading.bottom.equalToSuperview().inset(24)
        }
        
        infomationView.snp.makeConstraints {
            $0.top.equalTo(statusMessageLabel.snp.bottom).offset(24)
            $0.leading.equalTo(titleView.snp.trailing).offset(30)
            $0.trailing.bottom.equalToSuperview().inset(24)
        }
        
        changeInfoView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(24)
            
            passwordTitle.snp.makeConstraints {
                $0.leading.equalToSuperview()
            }
            
            passwordButton.snp.makeConstraints {
                $0.top.equalTo(passwordTitle.snp.bottom).offset(8)
                $0.leading.trailing.equalToSuperview()
                $0.height.equalTo(68)
                
                passwordButtonLabel.snp.makeConstraints {
                    $0.leading.equalToSuperview().inset(16)
                    $0.centerY.equalToSuperview()
                }
                
                passwordButtonImageView.snp.makeConstraints {
                    $0.trailing.equalToSuperview().inset(16)
                    $0.centerY.equalToSuperview()
                    $0.size.equalTo(24)
                }
            }
        }
    }
    
    func bindData(data: ProfileDTO) {
        profileNameLabel.text = data.name
        statusMessageLabel.text = data.message ?? "상태메세지"
        studentNumberLabel.text = data.id
        majorLabel.text = data.department
        
        //TODO: 졸업한 사람들이 애매함
        var status: String = ""
        if data.state == 0 || data.state == 1 {
            status = " ~ NOW"
        } else if data.state == 2 {
            periodTitleLabel.text = "가입시기"
        }
        
        periodLabel.text = data.joined_semester + status
        emailLabel.text = data.email
        
        roleView.isHidden = data.role != 1
        phoneLabel.text = data.phone.replacingOccurrences(
            of: "(\\d{3})(\\d{4})(\\d{4})",
            with: "$1-$2-$3",
            options: .regularExpression
        )
    }
}
