//
//  AuthService.swift
//  Release-iOS
//
//  Created by 신지원 on 2/14/25.
//

import Foundation

protocol AuthService {
    func login(loginData: LoginRequest) async throws -> LoginResponse
}

final class DefaultAuthService: Networking, AuthService {
    func login(loginData: LoginRequest) async throws -> LoginResponse {
        let parameters: [String: String] = [
            LoginRequest.CodingKeys.id.rawValue: loginData.id,
            LoginRequest.CodingKeys.password.rawValue: loginData.password
        ]
        
        let body = try JSONSerialization.data(withJSONObject: parameters, options: [])
        
        let request = try makeHTTPRequest(method: .post,
                                          path: ReleaseURL.auth.login,
                                          body: body)
        
        let (data, response) = try await URLSession.shared.data(for: request)
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw NetworkError.invalidResponse
        }
        
        let decodedResponse = try JSONDecoder().decode(LoginResponse.self, from: data)
        return decodedResponse
    }
}
