//
//  ActivityDetailViewController.swift
//  Release-iOS
//
//  Created by 신지원 on 11/4/24.
//

import UIKit

final class ActivityDetailViewController: UIViewController {
    
    //MARK: - Properties

    private let activityId: Int
    private let service: ActivityService
    private var activityURL: String? = ""
    
    //MARK: - UI Components
    
    private let rootView = ActivityDetailView()
    
    //MARK: - Initializer
    
    init(activityId: Int, service: ActivityService) {
        self.activityId = activityId
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

        fetchActivityData()
        bindAction()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.isHidden = true
        hideTabBar()
    }
    
    private func bindAction() {
        rootView.backButton.addTarget(self,
                                      action: #selector(backButtonTapped),
                                      for: .touchUpInside)
        
        rootView.joinButton.addTarget(self,
                                      action: #selector(joinButtonTapped),
                                      for: .touchUpInside)
    }
    
    @objc
    private func joinButtonTapped() {
        guard let activityURL else { return }
        openURL(activityURL)
    }
    
    @objc
    private func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
}

extension ActivityDetailViewController {
    private func fetchActivityData() {
        Task {
            await getActivityData()
        }
    }
    
    private func getActivityData() async {
        do {
            let response = try await service.getProjectDetail(activityId: activityId)
            let activityEntities = makeActivityEntity(from: response)
            rootView.bindData(activity: activityEntities)
            activityURL = activityEntities.link
        } catch {
            print("Failed to get book: \(error)")
        }
    }
    
    private func makeActivityEntity(from response: ActivityDetailDTO) -> ActivityDetailEntity {
        let infoString: ActivityInfo
        if response.state == 0 {
            infoString = .study
        } else {
            infoString = .project
        }
        
        let stateString: ActivityState
        if response.state == 0 {
            stateString = .beforeRecruit
        } else if (response.state == 1) {
            stateString = .recruiting
        } else {
            stateString = .running
        }
        
        return ActivityDetailEntity(id: response.id,
                                    title: response.title,
                                    content: response.content,
                                    leader: response.leader,
                                    image: response.image ?? "",
                                    link: response.link,
                                    info: infoString,
                                    state: stateString)
    }
}
