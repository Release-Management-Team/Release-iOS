//
//  BookDetailViewController.swift
//  Release-iOS
//
//  Created by 신지원 on 2/28/25.
//

import UIKit

final class BookDetailViewController: UIViewController {
    
    //MARK: - Properties
    
    private var bookId: String
    private var service: BookService
    
    //MARK: - UI Components
    
    private let rootView = BookDetailView()
    
    //MARK: - Initializer
    
    init(bookId: String, service: BookService) {
        self.bookId = bookId
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
        fetchBookList()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        viewWillAppearAction()
    }
    
    //MARK: - Action
    
    private func viewWillAppearAction() {
        navigationController?.navigationBar.isHidden = true
        hideTabBar()
    }
    
    private func bindAction() {
        self.rootView.backButton.addTarget(self,
                                           action: #selector(backButtonTapped),
                                           for: .touchUpInside)
    }
    
    @objc
    private func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
}

//MARK: - API

extension BookDetailViewController {
    private func fetchBookList() {
        Task {
            await getBookData()
        }
    }
    
    private func getBookData() async {
        do {
            let response = try await service.getBookDetail(id: self.bookId)
            let bookEntities = makeBookEntity(from: response.book)
            let isBorrowable = checkBookStatus(from: response.book)
            rootView.bookContentView.configure(with: bookEntities)
            rootView.isBorrowable(isAbled: isBorrowable)
        } catch {
            print("Failed to get book: \(error)")
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
    
    private func checkBookStatus(from response: BookDTO) -> Bool {
        var isBorrowable: Bool = false
        if response.availability == "available" {
            isBorrowable = true
        } else {
            isBorrowable = false
        }
        
        return isBorrowable
    }
}
