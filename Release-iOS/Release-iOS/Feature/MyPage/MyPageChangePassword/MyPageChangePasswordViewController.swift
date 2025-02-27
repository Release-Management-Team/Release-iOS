//
//  MyPageChangePasswordViewController.swift
//  Release-iOS
//
//  Created by 신지원 on 12/6/24.
//

import UIKit

final class MyPageChangePasswordViewController: UIViewController {
    
    //MARK: - Properties
    
    private var service: MemberService
    
    //MARK: - UI Components
    
    private let rootView = MyPageChangePasswordView()
    
    //MARK: - Initializer
    
    init(service: MemberService) {
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        viewWillAppearAction()
    }
    
    //MARK: - Action
    
    private func viewWillAppearAction() {
        hideTabBar()
        navigationController?.navigationBar.isHidden = false
        setSmallFontNavigationBar(title: StringLiterals.Navigation.passwordEdit,
                                  left: self.rootView.backButton, right: nil)
    }
    
    private func bindAction() {
        self.rootView.backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        self.rootView.changeButton.addTarget(self, action: #selector(changeButtonTapped), for: .touchUpInside)
    }
    
    @objc
    private func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc
    private func changeButtonTapped() {
        if self.rootView.isValidPassword() {
            Task {
                await changePassword(oldPassword: self.rootView.currentPasswordTextField.text ?? "",
                                     newPassword: self.rootView.changePasswordTextField.text ?? "")
            }
        }
    }
}

//MARK: - UITextFieldDelegate

extension MyPageChangePasswordViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

//MARK: - API

extension MyPageChangePasswordViewController {
    private func changePassword(oldPassword: String, newPassword: String) async {
        do {
            try await service.postUserProfile(changePasswordData: ChangePasswordRequest(oldPassword: oldPassword,
                                                                                        newPassword: newPassword))
            DispatchQueue.main.async {
                UserDefaults.standard.removeObject(forKey: StringLiterals.UserDefault.password)
                UserDefaults.standard.set(newPassword, forKey: StringLiterals.UserDefault.password)
                self.navigationController?.popViewController(animated: true)
            }
        } catch {
            print("Failed to change password: \(error.localizedDescription)")
        }
    }
}
