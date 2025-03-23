//
//  NoticeService.swift
//  Release-iOS
//
//  Created by 신지원 on 2/14/25.
//

import Foundation

protocol NoticeService {
    func getNoticeList() async throws -> NoticesResponse
    func getNoticeImportantList() async throws -> NoticesImportantResponse
    func postNotice(noticeData: NoticeRequest) async throws
}

final class DefaultNoticeService: Networking, NoticeService {
    func getNoticeList() async throws -> NoticesResponse {
        let request = try makeHTTPRequest(method: .get,
                                          path: ReleaseURL.notice.Yeynotice,
                                          headers: APIConstants.tokenHeaders)
        
        let (data, response) = try await URLSession.shared.data(for: request)
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw NetworkError.invalidResponse
        }
        
        let decodedResponse = try JSONDecoder().decode(NoticesResponse.self, from: data)
        return decodedResponse
    }
    
    func getNoticeImportantList() async throws -> NoticesImportantResponse {
        let request = try makeHTTPRequest(method: .get,
                                          path: ReleaseURL.notice.noticeImportant,
                                          headers: APIConstants.tokenHeaders)
        
        let (data, response) = try await URLSession.shared.data(for: request)
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw NetworkError.invalidResponse
        }
        
        let decodedResponse = try JSONDecoder().decode(NoticesImportantResponse.self, from: data)
        return decodedResponse
    }
    
    func postNotice(noticeData: NoticeRequest) async throws {
        let parameters: [String: String] = [
            NoticeRequest.CodingKeys.title.rawValue: noticeData.title,
            NoticeRequest.CodingKeys.content.rawValue: noticeData.content,
            NoticeRequest.CodingKeys.important.rawValue: noticeData.important
        ]
        
        let body = try JSONSerialization.data(withJSONObject: parameters, options: [])
        let request = try makeHTTPRequest(method: .post,
                                          path: ReleaseURL.notice.Yeynotice,
                                          headers: APIConstants.tokenHeaders,
                                          body: body)
        
        let (_, response) = try await URLSession.shared.data(for: request)
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw NetworkError.invalidResponse
        }
    }
}
