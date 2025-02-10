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
    
    weak var loginDelegate: LoginViewDelegate?
    
    private let logoImageView = UIImageView().then {
        $0.image = UIImage(named: "releaseBigLogo")
        $0.contentMode = .scaleAspectFit
    }
    
    let idTextField = UITextField().then {
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
    
    let passwordTextField = UITextField().then {
        //        $0.placeholder = StringLiterals.Login.password
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
    
    private let loginButton = UIButton(type: .system).then {
        $0.setTitle(StringLiterals.Login.buttonTitle, for: .normal)
        $0.titleLabel?.font = .heading4
        $0.backgroundColor = .primary1
        $0.setTitleColor(.black2, for: .normal)
        $0.layer.cornerRadius = 16
        $0.addTarget(self,
                     action: #selector(loginButtonTapped),
                     for: .touchUpInside)
    }
    
    let errorLabel = UILabel().then {
        $0.text = "아이디 또는 비밀번호가 일치하지 않습니다."
        $0.textColor = .primary4
        $0.font = .paragraph3
        $0.isHidden = true
    }
    
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
        backgroundColor = .black1
    }
    
    private func setHierarchy() {
        [logoImageView,
         idTextField,
         passwordTextField,
         loginButton,
         errorLabel].forEach {
            addSubview($0)
        }
    }
    
    private func setLayout() {
        logoImageView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(101)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(113)
        }
        
        idTextField.snp.makeConstraints { make in
            make.top.equalTo(logoImageView.snp.bottom).offset(56)
            make.leading.trailing.equalToSuperview().inset(24)
            make.height.equalTo(64)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(idTextField.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(24)
            make.height.equalTo(64)
        }
        
        errorLabel.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(8)
            $0.leading.equalToSuperview().inset(24)
        }
        
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(48)
            make.leading.trailing.equalToSuperview().inset(24)
            make.height.equalTo(55)
        }
    }
    
    @objc
    private func loginButtonTapped() {
        guard let id = idTextField.text, !id.isEmpty,
              let password = passwordTextField.text, !password.isEmpty else {
            return
        }
        
        loginDelegate?.loginButtonTapped(id: id, password: password)
    }
}
