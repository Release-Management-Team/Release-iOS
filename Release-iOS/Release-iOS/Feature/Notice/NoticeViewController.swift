//
//  NoticeViewController.swift
//  Release-iOS
//
//  Created by 신지원 on 11/6/24.
//

import UIKit

final class NoticeViewController: UIViewController {
    
    //MARK: - Properties
    
    private var service: NoticeService
    private var noticeListData: [NoticeDTO] = []
    
    //MARK: - UI Components
    
    private let rootView = NoticeView()
    
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
        
        setDelegate()
        setRegister()
        bindAction()
        fetchNotices()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        viewWillAppearAction()
    }
    
    //MARK: - Delegate & Register
    
    private func setDelegate() {
        rootView.tableView.delegate = self
        rootView.tableView.dataSource = self
    }
    
    private func setRegister() {
        rootView.tableView.register(NoticeCell.self, forCellReuseIdentifier: NoticeCell.identifier)
    }
    
    //MARK: - Action
    
    private func viewWillAppearAction() {
        hideTabBar()
        navigationController?.navigationBar.isHidden = false
        setSmallFontNavigationBar(title: StringLiterals.Navigation.notice,
                                  left: rootView.backButton,
                                  right: nil)
    }
    
    private func bindAction() {
        rootView.backButton.addTarget(self,
                                      action: #selector(backButtonTapped),
                                      for: .touchUpInside)
    }
    
    @objc
    private func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
}

//MARK: - UITableViewDataSource & UITableViewDelegate

extension NoticeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return noticeListData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NoticeCell.identifier, for: indexPath) as! NoticeCell
        cell.configure(with: noticeListData[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 105
    }
}

//MARK: - API

extension NoticeViewController {
    private func fetchNotices() {
        Task {
            await getNoticeListData()
        }
    }
    
    private func getNoticeListData() async {
        do {
            let response = try await service.getNoticeList()
            updateNoticeList(with: response.notices)
        } catch {
            print("Failed to get notice list: \(error.localizedDescription)")
        }
    }
    
    private func updateNoticeList(with notices: [NoticeDTO]) {
        DispatchQueue.main.async {
            self.noticeListData = notices
            self.rootView.tableView.reloadData()
        }
    }
}

