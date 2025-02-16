//
//  NoticeService.swift
//  Release-iOS
//
//  Created by 신지원 on 2/14/25.
//

import Foundation

protocol NoticeService {
    func getNoticeList() async throws -> NoticesResponse
}

final class DefaultNoticeService: Networking, NoticeService {
    func getNoticeList() async throws -> NoticesResponse {
        let request = try makeHTTPRequest(method: .get,
                                          path: ReleaseURL.notice.list,
                                          headers: APIConstants.tokenHeaders)
        
        let (data, response) = try await URLSession.shared.data(for: request)
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw NetworkError.invalidResponse
        }
        
        let decodedResponse = try JSONDecoder().decode(NoticesResponse.self, from: data)
        return decodedResponse
    }
}
