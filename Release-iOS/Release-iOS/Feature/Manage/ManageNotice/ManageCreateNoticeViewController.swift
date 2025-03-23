//
//  ManageCreateNoticeViewController.swift
//  Release-iOS
//
//  Created by 신지원 on 3/23/25.
//

import UIKit

final class ManageCreateNoticeViewController: UIViewController {
    
    //MARK: - Properties
    
    private var service: NoticeService
    
    //MARK: - UI Components
    
    private let rootView = ManageCreateNoticeView()
    
    //MARK: - Initializer
    
    init(service: NoticeService) {
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
        
        setSmallFontNavigationBar(title: StringLiterals.Navigation.manage,
                                  left: self.rootView.backButton, right: nil)
    }
    
    //MARK: - Action
    
    
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
        Task {            
            await createNotice(title: rootView.noticeTitleTextField.text ?? "",
                                 content: rootView.noticeContentTextView.text ?? "",
                                 important: rootView.noticeImportantSwitch.isOn)
        }
    }
}

//MARK: - UITextFieldDelegate

extension ManageCreateNoticeViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

//MARK: - API

extension ManageCreateNoticeViewController {
    private func createNotice(title: String, content: String, important: Bool) async {
        do {
            try await service.postNotice(noticeData: NoticeRequest(title: title, content: content, important: important))
            DispatchQueue.main.async {
                self.navigationController?.popViewController(animated: true)
            }
        } catch {
            print("Failed to create Notice: \(error.localizedDescription)")
        }
    }
}
