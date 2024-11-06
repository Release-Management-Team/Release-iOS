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
    private var activityData: [ActivityDTO] = activities1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupSegmentedControl()
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        setNavigationBar(title: "활동", left: nil, right: nil)
        showTabBar()
    }
    
    private func setupUI() {
        view.backgroundColor = .black1
        view.addSubview(segmentedControl)
        
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.addTarget(self, action: #selector(segmentedControlChanged), for: .valueChanged)
        
        segmentedControl.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(24)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(16)
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
        return activityData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ActivityCell", for: indexPath) as! ActivityCell
        cell.configure(with: activityData[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if isStudy {
            let detailVC = ActivityDetailViewController(activity: activityData[indexPath.row])
            navigationController?.pushViewController(detailVC, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 134
    }
}

class ActivityCell: UITableViewCell {
    
    private let cellView = UIView().then {
        $0.backgroundColor = .black2
        $0.layer.cornerRadius = 16
    }
    
    private let activityImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
    }
    
    private let categoryLabel = UILabel().then {
        $0.font = UIFont.paragraph3
        $0.textColor = UIColor.gray5
    }
    
    private let statusLabel = UILabel().then {
        $0.font = UIFont.paragraph3
        $0.textColor = UIColor.black2
        $0.backgroundColor = UIColor.primary1
        $0.layer.cornerRadius = 8
        $0.clipsToBounds = true
        $0.textAlignment = .center
    }
    
    private let titleLabel = UILabel().then {
        $0.font = UIFont.heading4
        $0.textColor = UIColor.gray1
    }
    
    private let contentLabel = UILabel().then {
        $0.font = UIFont.paragraph3
        $0.textColor = UIColor.gray3
        $0.numberOfLines = 2
    }
    
    private let personLabel = UILabel().then {
        $0.font = UIFont.paragraph2
        $0.textColor = UIColor.gray3
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = UIColor.black1
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with activity: ActivityDTO) {
        activityImageView.image = UIImage(named: activity.image)
        categoryLabel.text = activity.category
        statusLabel.text = activity.status
        titleLabel.text = activity.title
        contentLabel.text = activity.content
        personLabel.text = activity.person
    }
    
    private func setupLayout() {
        contentView.addSubview(cellView)
        cellView.addSubview(activityImageView)
        cellView.addSubview(categoryLabel)
        cellView.addSubview(statusLabel)
        cellView.addSubview(titleLabel)
        cellView.addSubview(contentLabel)
        cellView.addSubview(personLabel)
        
        cellView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.bottom.equalToSuperview().inset(8)
        }
        
        activityImageView.snp.makeConstraints { make in
            make.width.height.equalTo(96)
            make.leading.equalToSuperview().offset(16)
            make.centerY.equalToSuperview()
        }
        
        categoryLabel.snp.makeConstraints { make in
            make.leading.equalTo(activityImageView.snp.trailing).offset(16)
            make.top.equalToSuperview().offset(12)
        }
        
        statusLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-16)
            make.centerY.equalTo(categoryLabel)
            make.height.equalTo(24)
            make.width.equalTo(68)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(categoryLabel)
            make.trailing.equalTo(statusLabel.snp.leading).offset(-8)
            make.top.equalTo(categoryLabel.snp.bottom).offset(5)
        }
        
        contentLabel.snp.makeConstraints { make in
            make.leading.equalTo(categoryLabel)
            make.trailing.equalToSuperview().offset(-16)
            make.top.equalTo(titleLabel.snp.bottom).offset(5)
        }
        
        personLabel.snp.makeConstraints { make in
            make.leading.equalTo(categoryLabel)
            make.bottom.equalToSuperview().offset(-12)
        }
    }
}
