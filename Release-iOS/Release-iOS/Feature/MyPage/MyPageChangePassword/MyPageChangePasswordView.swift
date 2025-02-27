//
//  MyPageChangePasswordView.swift
//  Release-iOS
//
//  Created by 신지원 on 12/6/24.
//

import UIKit

import SnapKit
import Then

final class MyPageChangePasswordView: UIView {
    
    //MARK: - UI Components
    
    private let currentTitle = UILabel()
    private let changeTitle = UILabel()
    private let checkTitle = UILabel()
    
    var currentPasswordTextField = UITextField()
    var changePasswordTextField = UITextField()
    var checkPasswordTextField = UITextField()
    
    let currentWarningLabel = UILabel()
    let changeWarningLabel = UILabel()
    let checkWarningLabel = UILabel()
    
    let changeButtonView = UIView()
    let changeButton = UIButton()
    
    let backButton = UIButton()
    
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
        
        currentTitle.do {
            $0.text = StringLiterals.My.currentPassword
            $0.textColor = .gray3
            $0.font = .heading4
        }
        
        currentPasswordTextField.do {
            $0.textColor = .gray5
            $0.isSecureTextEntry = true
            $0.layer.cornerRadius = 16
            $0.backgroundColor = .black2
            
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 24, height: $0.frame.height))
            $0.leftView = paddingView
            $0.leftViewMode = .always
            $0.isSecureTextEntry = true
            $0.layer.borderColor = UIColor.primary4.cgColor
            $0.layer.borderWidth = 0
        }
        
        changeTitle.do {
            $0.text = StringLiterals.My.newPassword
            $0.textColor = .gray3
            $0.font = .heading4
        }
        
        changePasswordTextField.do {
            $0.textColor = .gray5
            $0.isSecureTextEntry = true
            $0.layer.cornerRadius = 16
            $0.backgroundColor = .black2
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 24, height: $0.frame.height))
            $0.leftView = paddingView
            $0.leftViewMode = .always
            $0.isSecureTextEntry = true
            $0.layer.borderColor = UIColor.primary4.cgColor
            $0.layer.borderWidth = 0
        }
        
        checkTitle.do {
            $0.text = StringLiterals.My.checkPassword
            $0.textColor = .gray3
            $0.font = .heading4
        }
        
        checkPasswordTextField.do {
            $0.textColor = .gray5
            $0.isSecureTextEntry = true
            $0.layer.cornerRadius = 16
            $0.backgroundColor = .black2
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 24, height: $0.frame.height))
            $0.leftView = paddingView
            $0.leftViewMode = .always
            $0.isSecureTextEntry = true
            $0.layer.borderColor = UIColor.primary4.cgColor
            $0.layer.borderWidth = 0
        }
        
        currentWarningLabel.do {
            $0.text = StringLiterals.My.isNotSame
            $0.textColor = .primary4
            $0.font = .paragraph3
            $0.isHidden = true
        }
        
        changeWarningLabel.do {
            $0.text = StringLiterals.My.warningPassword
            $0.textColor = .primary4
            $0.font = .paragraph3
            $0.isHidden = true
        }
        
        checkWarningLabel.do {
            $0.text = StringLiterals.My.isNotSame
            $0.textColor = .primary4
            $0.font = .paragraph3
            $0.isHidden = true
        }
        
        changeButtonView.do {
            $0.backgroundColor = .black2
        }
        
        changeButton.do {
            $0.backgroundColor = .primary1
            $0.setTitleColor(.black1, for: .normal)
            $0.setTitle(StringLiterals.My.changeButtonTitle, for: .normal)
            $0.titleLabel?.font = .heading4
            $0.layer.cornerRadius = 16
        }
        
        backButton.do {
            $0.setImage(.icArrow, for: .normal)
        }
    }
    
    private func setHierarchy() {
        [currentTitle,
         currentPasswordTextField,
         currentWarningLabel,
         changeTitle,
         changePasswordTextField,
         changeWarningLabel,
         checkTitle,
         checkPasswordTextField,
         checkWarningLabel,
         changeButtonView].forEach {
            addSubview($0)
        }
        changeButtonView.addSubview(changeButton)
    }
    
    private func setLayout() {
        currentTitle.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide).offset(37)
            $0.leading.equalToSuperview().inset(32)
        }
        
        currentPasswordTextField.snp.makeConstraints {
            $0.top.equalTo(currentTitle.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview().inset(24)
            $0.height.equalTo(64)
        }
        
        currentWarningLabel.snp.makeConstraints {
            $0.top.equalTo(currentPasswordTextField.snp.bottom).offset(16)
            $0.leading.equalTo(currentPasswordTextField.snp.leading).offset(8)
        }
        
        changeTitle.snp.makeConstraints {
            $0.top.equalTo(currentPasswordTextField.snp.bottom).offset(56)
            $0.leading.equalToSuperview().inset(32)
        }
        
        changePasswordTextField.snp.makeConstraints {
            $0.top.equalTo(changeTitle.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview().inset(24)
            $0.height.equalTo(64)
        }
        
        changeWarningLabel.snp.makeConstraints {
            $0.top.equalTo(changePasswordTextField.snp.bottom).offset(16)
            $0.leading.equalTo(changePasswordTextField.snp.leading).offset(8)
        }
        
        checkTitle.snp.makeConstraints {
            $0.top.equalTo(changePasswordTextField.snp.bottom).offset(57)
            $0.leading.equalToSuperview().inset(32)
        }
        
        checkPasswordTextField.snp.makeConstraints {
            $0.top.equalTo(checkTitle.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview().inset(24)
            $0.height.equalTo(64)
        }
        
        checkWarningLabel.snp.makeConstraints {
            $0.top.equalTo(checkPasswordTextField.snp.bottom).offset(16)
            $0.leading.equalTo(checkPasswordTextField.snp.leading).offset(8)
        }
        
        changeButtonView.snp.makeConstraints {
            $0.width.bottom.equalToSuperview()
            $0.height.equalTo(120)
            
            changeButton.snp.makeConstraints {
                $0.top.equalToSuperview().inset(13)
                $0.centerX.equalToSuperview()
                $0.width.equalTo(197)
                $0.height.equalTo(55)
            }
        }
        
        backButton.snp.makeConstraints {
            $0.size.equalTo(24)
        }
    }
    
    //MARK: - Custom Method
    
    func isValidPassword() -> Bool {
        guard let currentPasswrd = UserDefaults.standard.string(forKey: "password") else { return false }
        
        if !validatePasswordMatch(inputField: currentPasswordTextField, storedPassword: currentPasswrd, warningLabel: currentWarningLabel) {
            return false
        }

        if !validateRegex(inputField: changePasswordTextField, warningLabel: changeWarningLabel) {
            return false
        }
        
        if !validatePasswordMatch(inputField: checkPasswordTextField, storedPassword: changePasswordTextField.text, warningLabel: checkWarningLabel) {
            return false
        }

        return true
    }
    
    private func validatePasswordMatch(inputField: UITextField, storedPassword: String?, warningLabel: UILabel) -> Bool {
        let isValid = inputField.text == storedPassword
        updateUI(isValid: isValid, textField: inputField, warningLabel: warningLabel)
        return isValid
    }
    
    private func updateUI(isValid: Bool, textField: UITextField, warningLabel: UILabel) {
        textField.layer.borderWidth = isValid ? 0 : 1
        warningLabel.isHidden = isValid
    }
}
