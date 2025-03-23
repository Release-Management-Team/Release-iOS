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
        navigationController?.navigationBar.isHidden = true
        showTabBar()
        rootView.setupGreetingLabel()
        
        //Task => MainActor 유지
        //Task.detached {} => 독립된 비동기 처리
        Task {
            await getNoticeData()
        }
    }
    
    private func bindAction() {
        rootView.headerView.notificationButton.addTarget(self,
                                                         action: #selector(noticeButtonTapped),
                                                         for: .touchUpInside)
        
        rootView.homeExternalLinkView.websiteButton.addTarget(self,
                                                              action: #selector(webSiteButtonTapped),
                                                              for: .touchUpInside)
        
        rootView.homeExternalLinkView.notionButton.addTarget(self,
                                                             action: #selector(notionButtonTapped),
                                                             for: .touchUpInside)
        
        rootView.homeExternalLinkView.discordButton.addTarget(self,
                                                              action: #selector(discordButtonTapped),
                                                              for: .touchUpInside)
    }
    
    @objc
    private func noticeButtonTapped() {
        let noticeViewController = NoticeViewController(service: DefaultNoticeService())
        noticeViewController.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(noticeViewController, animated: true)
    }
    
    @objc
    private func webSiteButtonTapped() {
        openURL("https://release.sogang.ac.kr")
    }
    
    @objc
    private func notionButtonTapped() {
        openURL("https://smoggy-energy-2f8.notion.site/Release-18be6c14480080d6be3bc9aff9947e45")
    }
    
    @objc
    private func discordButtonTapped() {
        openURL("https://discord.gg/5P5q9m4H5Y")
    }
}

//MARK: - API

extension HomeViewController {
    private func getNoticeData() async {
        do {
            let response = try await service.getNoticeList()
            bindNoticeCell(notices: response)
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
