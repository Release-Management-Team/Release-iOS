//
//  ActivityDetailViewController.swift
//  Release-iOS
//
//  Created by 신지원 on 11/4/24.
//

import UIKit

final class ActivityDetailViewController: UIViewController {
    
    //MARK: - Properties
    
    private let activity: ActivityEntity
    
    //MARK: - UI Components
    
    private let rootView = ActivityDetailView()
    
    //MARK: - Initializer
    
    init(activity: ActivityEntity) {
        self.activity = activity
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

        rootView.bindData(activity: activity)
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
        print("참여하기 버튼 탭")
    }
    
    @objc
    private func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
}
