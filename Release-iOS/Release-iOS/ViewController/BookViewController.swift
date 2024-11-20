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
        getBookData()
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

extension BookViewController {
    private func getBookData() {
        getBookList { [weak self] success in
            DispatchQueue.main.async {
                if success {
                    print("Successfully fetched book list!")
                } else {
                    print("Failed to fetch book list.")
                }
            }
        }
    }
    
    private func getBookList(completion: @escaping (Bool) -> Void) {
        guard let url = URL(string: Config.baseURL + "/book") else { return }
        
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
                let bookData = try decoder.decode(BooksResponse.self, from: data)
                
                DispatchQueue.main.async {
                    self.bindBookCells(books: bookData)
                    completion(true)
                }
            } catch {
                print("Failed to parse JSON: \(error)")
                completion(false)
            }
        }.resume()
    }
    
    private func bindBookCells(books: BooksResponse) {
        self.bookData = books.books
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
