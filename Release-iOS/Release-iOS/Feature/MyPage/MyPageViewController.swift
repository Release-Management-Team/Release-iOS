//
//  MyPageViewController.swift
//  Release-iOS
//
//  Created by 신지원 on 12/6/24.
//

import UIKit

final class MyPageViewController: UIViewController {
    
    //MARK: - Properties
    
    private var service: MemberService
    
    //MARK: - UI Components
    
    private let rootView = MyPageView()
    
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
        fetchProfileData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        navigationController?.navigationBar.isHidden = true
        showTabBar()
    }
    
    //MARK: - Action
    
    private func bindAction() {
        rootView.myActivityView.myActivityButton.addTarget(self,
                                                                action: #selector(myActivityButtonTapped),
                                                                for: .touchUpInside)
        rootView.changeInfoView.passwordButton.addTarget(self,
                                               action: #selector(passwordButtonTapped),
                                               for: .touchUpInside)
        rootView.profileView.profileContentView.roleButton.addTarget(self,
                                                                     action: #selector(roleButtonTapped),
                                                                     for: .touchUpInside)
    }
    
    @objc
    private func myActivityButtonTapped() {
        let vc = MyPageBorrowingBookViewController(service: DefaultBookService())
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc
    private func passwordButtonTapped() {
        let vc = MyPageChangePasswordViewController(service: DefaultMemberService())
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc
    private func roleButtonTapped() {
        let vc = ManageViewController()
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

//MARK: - API

extension MyPageViewController {
    private func fetchProfileData() {
        Task {
            await getProfileData()
        }
    }
    
    private func getProfileData() async {
        do {
            let response = try await service.getUserProfile()
            let makeProfileData = makeProfileEntity(from: response.member)
            updateProfile(with: makeProfileData)
        } catch {
            print("Failed to get profile: \(error.localizedDescription)")
        }
    }
    
    private func updateProfile(with profile: ProfileEntity) {
        DispatchQueue.main.async {
            self.rootView.profileView.bindProfileData(data: profile)
        }
    }
    
    private func makeProfileEntity(from response: ProfileDTO) -> ProfileEntity {
        let informationData = ProfileInfomationEntity(
            id: response.id,
            department: response.department,
            phone: formatPhoneNumber(response.phone),
            email: response.email,
            state: (response.state == 0 || response.state == 1) ? "NOW" : "END",
            joined_semester: response.joined_semester
        )
        
        let checkExecutive = response.role == 1
        let contentData = ProfileContentEntity(
            name: response.name,
            message: response.message,
            isExecutive: checkExecutive,
            infomation: informationData
        )
        
        return ProfileEntity(
            image: response.image,
            contentEntity: contentData,
            informationEntity: informationData
        )
    }
}
