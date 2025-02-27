//
//  BookDetailViewController.swift
//  Release-iOS
//
//  Created by 신지원 on 2/28/25.
//

import UIKit

enum EntryType {
    case tabBar
    case myPage
}

final class BookDetailViewController: UIViewController {
    
    //MARK: - Properties
    
    private var entryType: EntryType
    private var bookId: String
    private var service: BookService
    
    //MARK: - UI Components
    
    private let rootView = BookDetailView()
    
    //MARK: - Initializer
    
    init(entryType: EntryType, bookId: String, service: BookService) {
        self.entryType = entryType
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
            let bookStatusResponse = checkBookStatus(from: response.book)
            rootView.bookContentView.configure(with: bookEntities)
            rootView.isBorrowable(buttonLabelText: bookStatusResponse.0, isAbled: bookStatusResponse.1)
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
    
    private func checkBookStatus(from response: BookDTO) -> (String, Bool) {
        var buttonText: String = ""
        let isAbled = response.availability == "available"
        if entryType == .tabBar {
            buttonText = isAbled ? StringLiterals.Book.avaliable : StringLiterals.Book.unavaliable
        } else {
            buttonText = StringLiterals.Book.returnBook
        }
        
        return (buttonText, isAbled)
    }
}
