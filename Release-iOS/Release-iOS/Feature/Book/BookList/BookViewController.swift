//
//  BookViewController.swift
//  Release-iOS
//
//  Created by 신지원 on 11/4/24.
//

import UIKit

final class BookViewController: UIViewController {
    
    //MARK: - Properties
    
    private var service: BookService
    private var bookListData: [BookEntity] = []
    
    //MARK: - UI Components
    
    private let rootView = BookView()
    
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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        viewWillAppearAction()
    }
    
    private func setDelegate() {
        rootView.tableView.delegate = self
        rootView.tableView.dataSource = self
    }
    
    private func setRegister() {
        rootView.tableView.register(BookCell.self, forCellReuseIdentifier: BookCell.identifier)
    }
    
    //MARK: - Action
    
    private func viewWillAppearAction() {
        navigationController?.navigationBar.isHidden = true
        showTabBar()
        fetchBookList()
    }
}

//MARK: - UITableViewDataSource & UITableViewDelegate

extension BookViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookListData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BookCell.identifier, for: indexPath) as! BookCell
        cell.configure(with: bookListData[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let bookID = bookListData[indexPath.row].id
        let bookDetailVC = BookDetailViewController(bookId: bookID,
                                                    service: DefaultBookService())
        bookDetailVC.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(bookDetailVC, animated: true)
    }
}

//MARK: - API

extension BookViewController {
    private func fetchBookList() {
        Task {
            await getBookListData()
        }
    }
    
    private func getBookListData() async {
        do {
            let response = try await service.getBookList()
            let bookEntities = response.books.map { makeBookEntity(from: $0) }
            updateBookList(with: bookEntities)
        } catch {
            print("Failed to get book list: \(error.localizedDescription)")
        }
    }
    
    private func updateBookList(with books: [BookEntity]) {
        DispatchQueue.main.async {
            self.bookListData = books
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
