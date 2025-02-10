//
//  LoginView.swift
//  Release-iOS
//
//  Created by 신지원 on 11/4/24.
//

import UIKit

final class LoginViewController: UIViewController {
    
    private let rootView = LoginView()
    
    override func loadView() {
        self.view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setDelegate()
    }
    
    private func setDelegate() {
        rootView.loginDelegate = self
    }
}

extension LoginViewController: LoginViewDelegate {
    func loginButtonTapped(id: String, password: String) {
        let loginData = LoginRequest(id: id, password: password)
        login(loginData: loginData) { [weak self] success in
            DispatchQueue.main.async {
                if success {
                    self?.rootView.errorLabel.isHidden = true
                    let tabBarVC = ReleaseTabBarController()
                    self?.navigationController?.pushViewController(tabBarVC, animated: true)
                    self?.navigationController?.isNavigationBarHidden = true
                } else {
                    self?.rootView.errorLabel.isHidden = false
                }
            }
        }
    }
}

extension LoginViewController {
    private func login(loginData: LoginRequest, completion: @escaping (Bool) -> Void) {
        guard let url = URL(string: Config.baseURL + "/auth/login") else { return }
        
        let parameters: [String: Any] = [
            LoginRequest.CodingKeys.id.rawValue: loginData.id,
            LoginRequest.CodingKeys.password.rawValue: loginData.password
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
                let decoder = JSONDecoder()
                let loginResponse = try decoder.decode(LoginResponse.self, from: data)
                
                UserDefaults.standard.set(loginResponse.accessToken, forKey: "accessToken")
                UserDefaults.standard.set(loginResponse.refreshToken, forKey: "refreshToken")
                UserDefaults.standard.set(loginData.password, forKey: "password")
                
                completion(true)
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
        if textField == rootView.idTextField {
            rootView.passwordTextField.becomeFirstResponder()
        } else {
            rootView.passwordTextField.resignFirstResponder()
        }
        return true
    }
}
