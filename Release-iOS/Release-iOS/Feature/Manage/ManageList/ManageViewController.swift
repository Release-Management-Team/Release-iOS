//
//  ManageViewController.swift
//  Release-iOS
//
//  Created by 신지원 on 3/23/25.
//

import UIKit

final class ManageViewController: UIViewController {
    
    //MARK: - Properties
    
    private var manageList:[String] = ["공지 작성", "공지 삭제"]
    
    //MARK: - UI Components
    
    private let rootView = ManageView()
    
    //MARK: - Life Cycle
    
    override func loadView() {
        self.view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setDelegate()
        setRegister()
        bindAction()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        navigationController?.navigationBar.isHidden = false
        setSmallFontNavigationBar(title: StringLiterals.Navigation.manage,
                                  left: self.rootView.backButton,
                                  right: nil)
        hideTabBar()
    }
    
    private func setDelegate() {
        rootView.tableView.delegate = self
        rootView.tableView.dataSource = self
    }
    
    private func setRegister() {
        rootView.tableView.register(ManageCell.self, forCellReuseIdentifier: ManageCell.identifier)
    }
    
    //MARK: - Action
    
    private func bindAction() {
        self.rootView.backButton.addTarget(self,
                                           action: #selector(backButtonTapped),
                                           for: .touchUpInside)
    }
    
    @objc
    private func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
}

//MARK: - UITableViewDataSource & UITableViewDelegate

extension ManageViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return manageList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ManageCell.identifier, for: indexPath) as! ManageCell
        cell.configure(with: manageList[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let selectRow = indexPath.row
        
        //공지 작성
        if selectRow == 0 {
            let createNoticeVC = ManageCreateNoticeViewController(service: DefaultNoticeService())
            self.navigationController?.pushViewController(createNoticeVC, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
}
