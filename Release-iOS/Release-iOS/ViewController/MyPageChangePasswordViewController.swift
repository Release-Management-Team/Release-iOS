//
//  MyPageChangePasswordViewController.swift
//  Release-iOS
//
//  Created by 신지원 on 12/6/24.
//

import UIKit

import SnapKit
import Then

final class MyPagePasswordViewController: UIViewController {
    
    private let rootView = MyPageChangePasswordView()
    
    override func loadView() {
        self.view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        hideTabBar()
        setSmallFontNavigationBar(title:"비밀번호 변경", left: self.rootView.backButton, right: nil)
    }
    
    private func setButton() {
        self.rootView.backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        self.rootView.changeButton.addTarget(self, action: #selector(changeButtonTapped), for: .touchUpInside)
    }
    
    @objc
    private func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc
    private func changeButtonTapped() {
        if self.rootView.isVaildPassword() {
            changePassword(old_password: self.rootView.currentPasswordTextField.text ?? "",
                           new_password: self.rootView.changePasswordTextField.text ?? "")
        }
    }
}

extension MyPagePasswordViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

extension MyPagePasswordViewController {
    private func changePassword(old_password: String, new_password: String) {
        postChangePassword(old_password: old_password, new_password: new_password) { success in
            DispatchQueue.main.async {
                if success {
                    print("Successfully change password!")
                } else {
                    print("Failed to change password.")
                }
            }
        }
    }
    
    private func postChangePassword(old_password: String, new_password: String, completion: @escaping (Bool) -> Void) {
        guard let url = URL(string: Config.baseURL + "/member/change-password") else { return }
        
        let parameters: [String: Any] = [
            "old_password": old_password,
            "new_password": new_password
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
        
        if let accessToken = UserDefaults.standard.string(forKey: "accessToken") {
            request.addValue("Bearer \(String(describing: accessToken))", forHTTPHeaderField: "Access")
        } else {
            print("Access Token is missing")
        }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Request failed with error: \(error)")
                completion(false)
                return
            }
            
            guard let data = data else {
                print("Error: No data received.")
                completion(false)
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                print("Error: Response is not HTTPURLResponse. Response: \(String(describing: response))")
                completion(false)
                return
            }
            
            guard httpResponse.statusCode == 200 else {
                print("Error: HTTP Status Code is \(httpResponse.statusCode)")
                completion(false)
                return
            }
            
            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                   let password = json["new_password"] as? String {
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
