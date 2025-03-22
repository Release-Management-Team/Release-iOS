//
//  LoginView.swift
//  Release-iOS
//
//  Created by 신지원 on 11/4/24.
//

import UIKit

final class LoginViewController: UIViewController {
    
    //MARK: - Properties
    
    private var service: AuthService
    
    //MARK: - UI Components
    
    private let rootView = LoginView()
    
    //MARK: - Initializer
    
    init(service: AuthService) {
        self.service = service
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Life Cycle
    
    override func loadView() {
        self.view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindAction()
    }
    
    //MARK: - Action
    
    private func bindAction() {
        rootView.loginButton.addTarget(self,
                                       action: #selector(loginButtonTapped),
                                       for: .touchUpInside)
    }
    
    @objc
    private func loginButtonTapped() {
        guard let id = rootView.idTextField.text, !id.isEmpty,
              let password = rootView.passwordTextField.text, !password.isEmpty else {
            return
        }
        
        let loginData = LoginRequest(id: id, password: password)
        Task { [weak self] in
            guard let self = self else { return }
            
            if let loginResponse = await self.login(loginData: loginData) {
                DispatchQueue.main.async {
                    
                    /// UserDefault 에 정보 저장
                    UserDefaults.standard.set(loginResponse.accessToken, forKey: StringLiterals.UserDefault.accessToken)
                    UserDefaults.standard.set(loginResponse.refreshToken, forKey: StringLiterals.UserDefault.refreshToken)
                    UserDefaults.standard.set(loginData.password, forKey: StringLiterals.UserDefault.password)
                    
                    /// 화면 전환
                    self.rootView.loginErrorLabel.isHidden = true
                    let tabBarVC = ReleaseTabBarController()
                    self.navigationController?.navigationBar.isHidden = true
                    self.navigationController?.pushViewController(tabBarVC, animated: true)
                }
            } else {
                DispatchQueue.main.async {
                    self.rootView.loginErrorLabel.isHidden = false
                }
            }
        }
    }
}

//MARK: - UITextFieldDelegate

extension LoginViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == rootView.idTextField {
            rootView.passwordTextField.becomeFirstResponder()
        } else {
            rootView.passwordTextField.resignFirstResponder()
        }
        return true
    }
}


//MARK: - API

extension LoginViewController {
    private func login(loginData: LoginRequest) async -> LoginResponse? {
        do {
            let response = try await service.login(loginData: loginData)
            print(response, "😄")
            return response
        } catch {
            print("Login failed: \(error.localizedDescription)")
            return nil
        }
    }
}
