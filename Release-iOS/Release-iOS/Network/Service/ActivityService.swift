//
//  ActivityService.swift
//  Release-iOS
//
//  Created by 신지원 on 2/27/25.
//

import Foundation

protocol ActivityService {
    func getProjectList() async throws -> ActivityResponse
    func getEventList() async throws -> EventsResponse
}

final class DefaultActivityService: Networking, ActivityService {
    func getProjectList() async throws -> ActivityResponse {
        let request = try makeHTTPRequest(method: .get,
                                          path: ReleaseURL.activity.activity,
                                          headers: APIConstants.tokenHeaders)
        
        let (data, response) = try await URLSession.shared.data(for: request)
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw NetworkError.invalidResponse
        }
        
        let decodedResponse = try JSONDecoder().decode(ActivityResponse.self, from: data)
        return decodedResponse
    }
    
    func getEventList() async throws -> EventsResponse {
        let request = try makeHTTPRequest(method: .get,
                                          path: ReleaseURL.activity.event,
                                          headers: APIConstants.tokenHeaders)
        
        let (data, response) = try await URLSession.shared.data(for: request)
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw NetworkError.invalidResponse
        }
        
        let decodedResponse = try JSONDecoder().decode(EventsResponse.self, from: data)
        return decodedResponse
    }
}
