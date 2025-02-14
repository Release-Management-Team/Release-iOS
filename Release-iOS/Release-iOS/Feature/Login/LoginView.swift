//
//  LoginView.swift
//  Release-iOS
//
//  Created by 신지원 on 2/10/25.
//

import UIKit

import SnapKit
import Then

protocol LoginViewDelegate: AnyObject {
    func loginButtonTapped(id: String, password: String)
}

final class LoginView: UIView {
    
    //MARK: - Properties
    
    weak var loginDelegate: LoginViewDelegate?
    
    //MARK: - UI Components
    
    private let logoImageView = UIImageView()
    let idTextField = UITextField()
    let passwordTextField = UITextField()
    let loginButton = UIButton()
    let loginErrorLabel = UILabel()
    
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
        
        logoImageView.do {
            $0.image = UIImage(named: "releaseBigLogo")
            $0.contentMode = .scaleAspectFit
        }
        
        idTextField.do {
            $0.textColor = .gray5
            $0.keyboardType = .numberPad
            $0.layer.cornerRadius = 16
            $0.backgroundColor = .black2
            $0.attributedPlaceholder = NSAttributedString(
                string: StringLiterals.Login.id,
                attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray5]
            )
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 24, height: $0.frame.height))
            $0.leftView = paddingView
            $0.leftViewMode = .always
        }
        
        passwordTextField.do {
            $0.textColor = .gray5
            $0.isSecureTextEntry = true
            $0.layer.cornerRadius = 16
            $0.backgroundColor = .black2
            $0.attributedPlaceholder = NSAttributedString(
                string: StringLiterals.Login.password,
                attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray5]
            )
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 24, height: $0.frame.height))
            $0.leftView = paddingView
            $0.leftViewMode = .always
        }
        
        loginButton.do {
            $0.setTitle(StringLiterals.Login.buttonTitle, for: .normal)
            $0.titleLabel?.font = .heading4
            $0.backgroundColor = .primary1
            $0.setTitleColor(.black2, for: .normal)
            $0.layer.cornerRadius = 16
        }
        
        loginErrorLabel.do {
            $0.text = "아이디 또는 비밀번호가 일치하지 않습니다."
            $0.textColor = .primary4
            $0.font = .paragraph3
            $0.isHidden = true
        }
    }
    
    private func setHierarchy() {
        [logoImageView,
         idTextField,
         passwordTextField,
         loginButton,
         loginErrorLabel].forEach {
            addSubview($0)
        }
    }
    
    private func setLayout() {
        logoImageView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(101)
            $0.centerX.equalToSuperview()
            $0.width.height.equalTo(113)
        }
        
        idTextField.snp.makeConstraints {
            $0.top.equalTo(logoImageView.snp.bottom).offset(56)
            $0.leading.trailing.equalToSuperview().inset(24)
            $0.height.equalTo(64)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(idTextField.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview().inset(24)
            $0.height.equalTo(64)
        }
        
        loginErrorLabel.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(8)
            $0.leading.equalToSuperview().inset(24)
        }
        
        loginButton.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(48)
            $0.leading.trailing.equalToSuperview().inset(24)
            $0.height.equalTo(55)
        }
    }
}
