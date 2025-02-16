//
//  HomeViewController.swift
//  Release-iOS
//
//  Created by 신지원 on 11/4/24.
//

import UIKit

final class HomeViewController: UIViewController {

    //MARK: - Properties
    
    private var service: NoticeService
    
    //MARK: - UI Components
    
    private let rootView = HomeView()
    
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
        
        viewWillAppearAction()
    }
    
    //MARK: - Action
    
    private func viewWillAppearAction() {
        showTabBar()
        rootView.setupGreetingLabel()
        
        //Task => MainActor 유지
        //Task.detached {} => 독립된 비동기 처리
        Task {
            await getNoticeData()
        }
    }
    
    private func bindAction() {
        rootView.notificationButton.addTarget(self,
                                              action: #selector(noticeButtonTapped),
                                              for: .touchUpInside)
    }
    
    @objc
    private func noticeButtonTapped() {
        let noticeViewController = NoticeViewController()
        noticeViewController.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(noticeViewController, animated: true)
    }
}

//MARK: - API

extension HomeViewController {
    private func getNoticeData() async {
        do {
            let respone = try await service.getNoticeList()
            bindNoticeCell(notices: respone)
        } catch {
            print("Failed to get notice: \(error.localizedDescription)")
        }
    }
    
    private func bindNoticeCell(notices: NoticesResponse) {
        let noticeList = notices.notices
        if let lastNotice = noticeList.last?.content {
            DispatchQueue.main.async {
                self.rootView.bindNoticeData(lastNotice: lastNotice)
            }
        }
    }
}


