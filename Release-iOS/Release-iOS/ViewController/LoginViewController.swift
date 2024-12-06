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
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 24, height: $0.frame.height))
        $0.leftView = paddingView
        $0.leftViewMode = .always
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
        $0.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
    }
    
    private let errorLabel = UILabel().then {
        $0.text = "아이디 또는 비밀번호가 일치하지 않습니다."
        $0.textColor = .primary4
        $0.font = .paragraph3
        $0.isHidden = true
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
        view.addSubview(errorLabel)
        
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
        
        login(id: id, password: password) { [weak self] success in
            DispatchQueue.main.async {
                if success {
                    self?.errorLabel.isHidden = true
                    let tabBarVC = ReleaseTabBarController()
                    self?.navigationController?.pushViewController(tabBarVC, animated: true)
                    self?.navigationController?.isNavigationBarHidden = true
                } else {
                    self?.errorLabel.isHidden = false
                }
            }
        }
    }
}

extension LoginViewController {
    private func login(id: String, password: String, completion: @escaping (Bool) -> Void) {
        guard let url = URL(string: Config.baseURL + "/auth/login") else { return }
        
        let parameters: [String: Any] = [
            "id": id,
            "password": password
        ]
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json",
                         forHTTPHeaderField: "Content-Type")
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
        } catch {
            print("Failed to encode parameters: \(error)")
            completion(false)
            return
        }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Request failed with error: \(error)")
                completion(false)
                return
            }
            
            guard let data = data,
                  let httpResponse = response as? HTTPURLResponse,
                  httpResponse.statusCode == 200 else {
                completion(false)
                return
            }
            
            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                   let accessToken = json["access_token"] as? String,
                   let refreshToken = json["refresh_token"] as? String {
                    UserDefaults.standard.set(accessToken, forKey: "accessToken")
                    UserDefaults.standard.set(refreshToken, forKey: "refreshToken")
                    UserDefaults.standard.set(password, forKey: "password")
                    completion(true)
                } else {
                    completion(false)
                }
            } catch {
                print("Failed to parse JSON: \(error)")
                completion(false)
            }
        }.resume()
    }
}

extension LoginViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == idTextField {
          passwordTextField.becomeFirstResponder()
        } else {
          passwordTextField.resignFirstResponder()
        }
        return true
    }
}
