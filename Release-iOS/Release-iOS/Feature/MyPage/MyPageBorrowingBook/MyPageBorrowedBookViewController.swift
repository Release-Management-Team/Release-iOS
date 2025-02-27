//
//  MyPageBorrowingBookViewController.swift
//  Release-iOS
//
//  Created by 신지원 on 2/28/25.
//

import UIKit

final class MyPageBorrowingBookViewController: UIViewController {
    
    //MARK: - Properties
    
    private var service: BookService
    private var borrowingBookListData: [BookEntity] = []
    
    //MARK: - UI Components
    
    private let rootView = MyPageBorrowingBookView()
    
    //MARK: - Initializer
    
    init(service: BookService) {
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
        
        viewWillAppearAction()
    }
    
    //MARK: - Delegate & Register
    
    private func setDelegate() {
        rootView.tableView.delegate = self
        rootView.tableView.dataSource = self
    }
    
    private func setRegister() {
        rootView.tableView.register(BookCell.self, forCellReuseIdentifier: BookCell.identifier)
    }
    
    //MARK: - Action
    
    private func viewWillAppearAction() {
        setSmallFontNavigationBar(title: StringLiterals.Navigation.bookCheck,
                                  left: rootView.backButton, right: nil)
        hideTabBar()
        fetchBookList()
    }
    
    private func bindAction() {
        rootView.backButton.addTarget(self,
                                      action: #selector(backButtonTapped),
                                      for: .touchUpInside)
    }
    
    @objc
    private func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
}

//MARK: - UITableViewDataSource & UITableViewDelegate

extension MyPageBorrowingBookViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return borrowingBookListData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BookCell.identifier, for: indexPath) as! BookCell
        cell.configure(with: borrowingBookListData[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let bookID = borrowingBookListData[indexPath.row].id
        let bookDetailVC = BookDetailViewController(entryType: .myPage,
                                                    bookId: bookID,
                                                    service: DefaultBookService())
        bookDetailVC.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(bookDetailVC, animated: true)
    }
}

//MARK: - API

extension MyPageBorrowingBookViewController {
    private func fetchBookList() {
        Task {
            await getBookListData()
        }
    }
    
    private func getBookListData() async {
        do {
            let response = try await service.getBookBorrowingList()
            let bookEntities = response.books.map { makeBookEntity(from: $0) }
            updateBookList(with: bookEntities)
        } catch {
            print("Failed to get book list: \(error.localizedDescription)")
        }
    }
    
    private func updateBookList(with books: [BookEntity]) {
        DispatchQueue.main.async {
            self.borrowingBookListData = books
            self.rootView.tableView.reloadData()
        }
    }
    
    private func makeBookEntity(from response: BookDTO) -> BookEntity {
        let tags = response.tags.joined(separator: ", ")
        var statusText: String = ""
        var statusColor: UIColor = .primary1
        switch response.availability {
        case "available":
            statusText = "대여 가능"
            statusColor = .primary1
        case "unavailable":
            statusText = "대여 불가"
            statusColor = .primary2
        case "rented":
            statusText = "대여 중"
            statusColor = .primary2
        default:
            statusText = ""
            statusColor = .clear
        }
        
        return BookEntity(id: response.id,
                          imageURL: response.image,
                          title: response.title,
                          author: response.author,
                          tags: tags,
                          statusText: statusText,
                          statusColor: statusColor)
    }
}
