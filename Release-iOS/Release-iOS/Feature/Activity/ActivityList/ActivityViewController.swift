//
//  ActivityViewController.swift
//  Release-iOS
//
//  Created by 신지원 on 11/4/24.
//

import UIKit

final class ActivityViewController: UIViewController {
    
    //MARK: - Properties
    
    private var isStudy = true
    private var activityData: [ActivityEntity] = []
    private var eventData: [EventEntity]  = []
    private let service: ActivityService
    
    //MARK: - UI Components
    
    private let rootView = ActivityView()
    
    //MARK: - Initializer
    
    init(service: ActivityService) {
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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        navigationController?.navigationBar.isHidden = true
        showTabBar()
        fetchActivityList()
    }
    
    //MARK: - Delegate & Register
    
    private func setDelegate() {
        rootView.tableView.delegate = self
        rootView.tableView.dataSource = self
    }
    
    private func setRegister() {
        rootView.tableView.register(ActivityCell.self, forCellReuseIdentifier: ActivityCell.identifier)
        rootView.tableView.register(EventCell.self, forCellReuseIdentifier: EventCell.identifier)
    }
    
    //MARK: - Action

    private func bindAction() {
        rootView.segmentedControl.addTarget(self,
                                            action: #selector(segmentedControlChanged),
                                            for: .valueChanged)
    }
    
    @objc
    private func segmentedControlChanged() {
        isStudy = rootView.segmentedControl.selectedSegmentIndex == 0
        rootView.tableView.reloadData()
    }
}

//MARK: - UITableViewDataSource & UITableViewDelegate

extension ActivityViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isStudy ? activityData.count: eventData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if isStudy {
            let cell = tableView.dequeueReusableCell(withIdentifier: ActivityCell.identifier, for: indexPath) as! ActivityCell
            cell.configure(with: activityData[indexPath.row])
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: EventCell.identifier, for: indexPath) as! EventCell
            cell.configure(with: eventData[indexPath.row])
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if isStudy {
            let detailVC = ActivityDetailViewController(activity: activityData[indexPath.row])
            detailVC.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(detailVC, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        isStudy ? 134 : 166
    }
}

//MARK: - API

extension ActivityViewController {
    private func fetchActivityList() {
        Task {
            await getActivityListData()
            await getEventListData()
        }
    }
    
    //Service 와 연결하는 로직
    private func getActivityListData() async {
        do {
            let response = try await service.getProjectList()
            let activityEntities = response.activities.map { makeActivityEntity(from: $0) }
            updateActivityList(with: activityEntities)
        } catch {
            print("Failed to get activity list: \(error.localizedDescription)")
        }
    }
    
    private func getEventListData() async {
        do {
            let response = try await service.getEventList()
            let eventEntities = response.events.map { makeEventEntity(from: $0) }
            updateEventList(with: eventEntities)
        } catch {
            print("Failed to get activity list: \(error.localizedDescription)")
        }
    }
    
    //TableView Update 하는 로직
    private func updateActivityList(with activity: [ActivityEntity]) {
        DispatchQueue.main.async {
            self.activityData = activity
            self.rootView.tableView.reloadData()
        }
    }
    
    private func updateEventList(with event: [EventEntity]) {
        DispatchQueue.main.async {
            self.eventData = event
            self.rootView.tableView.reloadData()
        }
    }
    
    //Entity 설정하는 로직
    private func makeActivityEntity(from response: ActivityDTO) -> ActivityEntity {
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
        
        return ActivityEntity(id: response.id,
                              title: response.title,
                              leader: response.leader,
                              image: response.image,
                              info: infoString,
                              state: stateString)
    }
    
    private func makeEventEntity(from response: EventDTO) -> EventEntity {
        let convertTime = convertDate(response.start_time)
        return EventEntity(id: response.id,
                           title: response.title,
                           start_time: convertTime ?? "",
                           place: response.place)
    }
}
