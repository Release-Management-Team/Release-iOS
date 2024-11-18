//
//  BookViewController.swift
//  Release-iOS
//
//  Created by 신지원 on 11/4/24.
//

import UIKit

import SnapKit

final class BookViewController: UIViewController {
    
    private var tableView: UITableView!
    private var bookData: [BookDTO] = []
    private let navigationLabel = UILabel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        navigationController?.isNavigationBarHidden = true
        showTabBar()
    }
    
    private func setupUI() {
        view.backgroundColor = .black1
        
        view.addSubview(navigationLabel)
        navigationLabel.do {
            $0.text = "도서"
            $0.font = .heading3
            $0.textColor = .gray1
        }
        navigationLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(19)
            $0.leading.equalToSuperview().inset(24)
        }
    }
    
    private func setupTableView() {
        tableView = UITableView().then {
            $0.delegate = self
            $0.dataSource = self
            $0.backgroundColor = .black1
            $0.separatorStyle = .none
            $0.showsVerticalScrollIndicator = false
            $0.register(BookCell.self, forCellReuseIdentifier: "BookCell")
            $0.backgroundColor = .black1
        }
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.equalTo(navigationLabel.snp.bottom).offset(19)
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalToSuperview()
        }
    }
}

extension BookViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookCell", for: indexPath) as! BookCell
        cell.configure(with: bookData[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 161
    }
}

class BookCell: UITableViewCell {
    
    private let cellView = UIView().then {
        $0.backgroundColor = .black2
        $0.layer.cornerRadius = 16
    }
    
    private let bookImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
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
        $0.numberOfLines = 2
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
    
    private let tagLabel = UILabel().then {
        $0.font = UIFont.paragraph3
        $0.textColor = UIColor.gray3
        $0.numberOfLines = 1
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = UIColor.black1
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with book: BookDTO) {
        bookImageView.image = UIImage(named: book.image)
        statusLabel.text = book.availability
        titleLabel.text = book.title
        personLabel.text = book.author
        tagLabel.text = book.tags.joined(separator: ", ")
    }
    
    private func setupLayout() {
        contentView.addSubview(cellView)
        cellView.addSubview(bookImageView)
        cellView.addSubview(statusLabel)
        cellView.addSubview(titleLabel)
        cellView.addSubview(personLabel)
        cellView.addSubview(tagLabel)
        
        cellView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.bottom.equalToSuperview().inset(8)
        }
        
        bookImageView.snp.makeConstraints { make in
            make.width.height.equalTo(96)
            make.leading.equalToSuperview().offset(16)
            make.centerY.equalToSuperview()
        }
        
        statusLabel.snp.makeConstraints { make in
            make.top.trailing.equalToSuperview().inset(16)
            make.height.equalTo(24)
            make.width.equalTo(68)
        }
        
        titleLabel.snp.makeConstraints { 
            $0.top.equalTo(statusLabel.snp.bottom).offset(8)
            $0.leading.equalTo(bookImageView.snp.trailing).offset(10)
            $0.trailing.equalToSuperview().inset(16)
        }
        
        
        personLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(8)
            $0.leading.equalTo(bookImageView.snp.trailing).offset(10)
            $0.trailing.equalToSuperview().inset(16)
        }
        
        tagLabel.snp.makeConstraints {
            $0.top.equalTo(personLabel.snp.bottom).offset(8)
            $0.leading.equalTo(bookImageView.snp.trailing).offset(10)
            $0.trailing.equalToSuperview().inset(16)
        }
    }
}

