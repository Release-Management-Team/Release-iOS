//
//  LoginView.swift
//  Release-iOS
//
//  Created by 신지원 on 11/4/24.
//

import UIKit

import SnapKit
import Then

final class LoginViewController: UIViewController {
    
    private let logoImageView = UIImageView().then {
        $0.image = UIImage(named: "releaseBigLogo")
        $0.contentMode = .scaleAspectFit
    }
    
    private let idTextField = UITextField().then {
        $0.textColor = .gray5
        $0.keyboardType = .numberPad
        $0.layer.cornerRadius = 16
        $0.backgroundColor = .black2
        $0.attributedPlaceholder = NSAttributedString(
            string: StringLiterals.Login.id,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray5]
        )
    }
    
    private let passwordTextField = UITextField().then {
//        $0.placeholder = StringLiterals.Login.password
        $0.textColor = .gray5
        $0.isSecureTextEntry = true
        $0.layer.cornerRadius = 16
        $0.backgroundColor = .black2
        $0.attributedPlaceholder = NSAttributedString(
            string: StringLiterals.Login.password,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray5]
        )
    }
    
    private let loginButton = UIButton(type: .system).then {
        $0.setTitle(StringLiterals.Login.buttonTitle, for: .normal)
        $0.titleLabel?.font = .heading4
        $0.backgroundColor = .primary1
        $0.setTitleColor(.black2, for: .normal)
        $0.layer.cornerRadius = 16
        $0.addTarget(LoginViewController.self, action: #selector(loginButtonTapped), for: .touchUpInside)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .black1
        
        view.addSubview(logoImageView)
        view.addSubview(idTextField)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)
        
        logoImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(101)
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
        
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(48)
            make.leading.trailing.equalToSuperview().inset(24)
            make.height.equalTo(55)
        }
    }
    
    @objc private func loginButtonTapped() {
        let tabBarVC = ReleaseTabBarController()
        tabBarVC.modalPresentationStyle = .fullScreen
        present(tabBarVC, animated: true, completion: nil)
    }
}
