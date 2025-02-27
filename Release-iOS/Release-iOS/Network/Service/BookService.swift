//
//  BookService.swift
//  Release-iOS
//
//  Created by 신지원 on 2/28/25.
//

import Foundation

protocol BookService {
    func getBookList() async throws -> BooksResponse
    func getBookDetail(id: String) async throws -> BookResponse
    func getBookBorrowingList() async throws -> BooksResponse
}

final class DefaultBookService: Networking, BookService {
    func getBookList() async throws -> BooksResponse {
        let request = try makeHTTPRequest(method: .get,
                                          path: ReleaseURL.book.book,
                                          headers: APIConstants.tokenHeaders)
        
        let (data, response) = try await URLSession.shared.data(for: request)
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw NetworkError.invalidResponse
        }
        
        let decodedResponse = try JSONDecoder().decode(BooksResponse.self, from: data)
        return decodedResponse
    }
    
    func getBookDetail(id: String) async throws -> BookResponse {
        let request = try makeHTTPRequest(method: .get,
                                          path: ReleaseURL.book.bookRead(bookId: id),
                                          headers: APIConstants.tokenHeaders)
        
        let (data, response) = try await URLSession.shared.data(for: request)
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw NetworkError.invalidResponse
        }
        
        let decodedResponse = try JSONDecoder().decode(BookResponse.self, from: data)
        return decodedResponse
    }
    
    func getBookBorrowingList() async throws -> BooksResponse {
        let request = try makeHTTPRequest(method: .get,
                                          path: ReleaseURL.book.bookBorrow,
                                          headers: APIConstants.tokenHeaders)
        
        let (data, response) = try await URLSession.shared.data(for: request)
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw NetworkError.invalidResponse
        }
        
        let decodedResponse = try JSONDecoder().decode(BooksResponse.self, from: data)
        return decodedResponse
    }
}
