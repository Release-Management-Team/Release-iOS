//
//  ActivityViewController.swift
//  Release-iOS
//
//  Created by 신지원 on 11/4/24.
//

import UIKit
import SnapKit

final class ActivityViewController: UIViewController {
    
    private let segmentedControl = UISegmentedControl(items: [
        StringLiterals.Activity.study,
        StringLiterals.Activity.event
    ])
    
    private var tableView: UITableView!
    private var isStudy = true
    private var activityData: [ActivityDTO] = dummyActivityResult.activities
    private var eventData: [EventDTO]  = dummyEventResponse.evets
    private let navigationLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupSegmentedControl()
        setupTableView()
        
//        getProjectData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        navigationController?.navigationBar.isHidden = true
        showTabBar()
    }
    
    private func setupUI() {
        view.backgroundColor = .black1
        view.addSubview(navigationLabel)
        view.addSubview(segmentedControl)
        
        navigationLabel.do {
            $0.text = "활동"
            $0.font = .heading3
            $0.textColor = .gray1
        }
        navigationLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(19)
            $0.leading.equalToSuperview().inset(24)
        }
        
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.addTarget(self, action: #selector(segmentedControlChanged), for: .valueChanged)
        
        segmentedControl.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(24)
            make.top.equalTo(navigationLabel.snp.bottom).offset(19)
            make.height.equalTo(40)
        }
    }
    
    private func setupSegmentedControl() {
        segmentedControl.selectedSegmentTintColor = .primary1
        
        let normalAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.gray5,
            .font: UIFont.heading4
        ]
        segmentedControl.setTitleTextAttributes(normalAttributes, for: .normal)
        
        let selectedAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.black1,
            .font: UIFont.heading4
        ]
        segmentedControl.setTitleTextAttributes(selectedAttributes, for: .selected)
    }
    
    private func setupTableView() {
        tableView = UITableView().then {
            $0.delegate = self
            $0.dataSource = self
            $0.backgroundColor = .black1
            $0.separatorStyle = .none
            $0.showsVerticalScrollIndicator = false
            $0.register(ActivityCell.self, forCellReuseIdentifier: "ActivityCell")
            $0.register(EventCell.self, forCellReuseIdentifier: "EventCell")
            $0.backgroundColor = .black1
        }
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.equalTo(segmentedControl.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalToSuperview()
        }
    }
    
    @objc
    private func segmentedControlChanged() {
        isStudy = segmentedControl.selectedSegmentIndex == 0
        tableView.reloadData()
    }
}

extension ActivityViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isStudy ? activityData.count: eventData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if isStudy {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ActivityCell", for: indexPath) as! ActivityCell
            cell.configure(with: activityData[indexPath.row])
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "EventCell", for: indexPath) as! EventCell
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

extension ActivityViewController {
    private func getProjectData() {
        getProjectList { [weak self] success in
            DispatchQueue.main.async {
                if success {
                    print("Successfully fetched event list!")
                } else {
                    print("Failed to fetch event list.")
                }
            }
        }
    }
    
    private func getProjectList(completion: @escaping (Bool) -> Void) {
        guard let url = URL(string: Config.baseURL + "/activity") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("application/json",
                         forHTTPHeaderField: "Content-Type")
        
        if let accessToken = UserDefaults.standard.string(forKey: "accessToken") {
            request.addValue("Bearer \(String(describing: accessToken))", forHTTPHeaderField: "Access")
        } else {
            print("Access Token is missing")
        }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Request failed with error: \(error)")
                completion(false)
                return
            }
            
            guard let data = data else {
                print("Error: No data received.")
                completion(false)
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                print("Error: Response is not HTTPURLResponse. Response: \(String(describing: response))")
                completion(false)
                return
            }
            
            guard httpResponse.statusCode == 200 else {
                print("Error: HTTP Status Code is \(httpResponse.statusCode)")
                print("Error: HTTP Status Code is \(httpResponse.description)")
                completion(false)
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let activityData = try decoder.decode(ActivityResult.self, from: data)
                
                DispatchQueue.main.async {
                    self.bindProjectCell(activities: activityData)
                    completion(true)
                }
            } catch {
                print("Failed to parse JSON: \(error)")
                completion(false)
            }
        }.resume()
    }
    
    private func bindProjectCell(activities: ActivityResult) {
        self.activityData = activities.activities
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    private func getEventData() {
        getEventList { [weak self] success in
            DispatchQueue.main.async {
                if success {
                    print("Successfully fetched event list!")
                } else {
                    print("Failed to fetch event list.")
                }
            }
        }
    }
    
    private func getEventList(completion: @escaping (Bool) -> Void) {
        guard let url = URL(string: Config.baseURL + "/activity/event") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("application/json",
                         forHTTPHeaderField: "Content-Type")
        
        if let accessToken = UserDefaults.standard.string(forKey: "accessToken") {
            request.addValue("Bearer \(String(describing: accessToken))", forHTTPHeaderField: "Access")
        } else {
            print("Access Token is missing")
        }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Request failed with error: \(error)")
                completion(false)
                return
            }
            
            guard let data = data else {
                print("Error: No data received.")
                completion(false)
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                print("Error: Response is not HTTPURLResponse. Response: \(String(describing: response))")
                completion(false)
                return
            }
            
            guard httpResponse.statusCode == 200 else {
                print("Error: HTTP Status Code is \(httpResponse.statusCode)")
                completion(false)
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let eventData = try decoder.decode(EventResponse.self, from: data)
                
                DispatchQueue.main.async {
                    self.bindEventCell(events: eventData)
                    completion(true)
                }
            } catch {
                print("Failed to parse JSON: \(error)")
                completion(false)
            }
        }.resume()
    }
    
    private func bindEventCell(events: EventResponse) {
        self.eventData = events.evets
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}


