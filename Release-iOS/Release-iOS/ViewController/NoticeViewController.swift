//
//  NoticeViewController.swift
//  Release-iOS
//
//  Created by 신지원 on 11/6/24.
//

import UIKit

import SnapKit
import Then

final class NoticeViewController: UIViewController {
    
    private var tableView: UITableView!
    private var noticeData: [NoticeDTO] = []
    private let backButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupTableView()
        
        getNoticeData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        hideTabBar()
        navigationController?.navigationBar.isHidden = false
        setSmallFontNavigationBar(title:"공지", left: backButton, right: nil)
    }
    
    private func setupUI() {
        view.backgroundColor = .black1
        
        backButton.do {
            $0.setImage(.icArrow, for: .normal)
            $0.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        }
        
        backButton.snp.makeConstraints {
            $0.size.equalTo(24)
        }
    }
    
    private func setupTableView() {
        tableView = UITableView().then {
            $0.delegate = self
            $0.dataSource = self
            $0.backgroundColor = .black1
            $0.separatorStyle = .none
            $0.showsVerticalScrollIndicator = false
            $0.register(NoticeCell.self, forCellReuseIdentifier: "NoticeCell")
            $0.backgroundColor = .black1
        }
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(20)
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalToSuperview()
        }
    }
    
    @objc
    private func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
}

extension NoticeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return noticeData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NoticeCell", for: indexPath) as! NoticeCell
        cell.configure(with: noticeData[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 105
    }
}

extension NoticeViewController {
    private func getNoticeData() {
        getNoticeList { [weak self] success in
            DispatchQueue.main.async {
                if success {
                    print("Successfully fetched notice list!")
                } else {
                    print("Failed to fetch notice list.")
                }
            }
        }
    }
    
    private func getNoticeList(completion: @escaping (Bool) -> Void) {
        guard let url = URL(string: Config.baseURL + "/notice/list") else { return }
        
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
                let noticeData = try decoder.decode(NoticesResponse.self, from: data)
                
                DispatchQueue.main.async {
                    self.bindNoticeCell(notices: noticeData)
                    completion(true)
                }
            } catch {
                print("Failed to parse JSON: \(error)")
                completion(false)
            }
        }.resume()
    }
    
    private func bindNoticeCell(notices: NoticesResponse) {
        self.noticeData = notices.notices
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

