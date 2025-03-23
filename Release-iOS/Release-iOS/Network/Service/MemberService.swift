//
//  MemberService.swift
//  Release-iOS
//
//  Created by 신지원 on 2/17/25.
//

import Foundation

protocol MemberService {
    func getUserProfile() async throws -> ProfileResponse
    func postUserProfile(changePasswordData: ChangePasswordRequest) async throws
    func postRegisterDeviceToken(deviceData: FCMTokenRequest) async throws
}

final class DefaultMemberService: Networking, MemberService {
    func getUserProfile() async throws -> ProfileResponse {
        let request = try makeHTTPRequest(method: .get,
                                          path: ReleaseURL.member.myProfile,
                                          headers: APIConstants.tokenHeaders)
        
        let (data, response) = try await URLSession.shared.data(for: request)
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw NetworkError.invalidResponse
        }
        
        let decodedResponse = try JSONDecoder().decode(ProfileResponse.self, from: data)
        return decodedResponse
    }
    
    func postUserProfile(changePasswordData: ChangePasswordRequest) async throws {
        let parameters: [String: String] = [
            ChangePasswordRequest.CodingKeys.oldPassword.rawValue: changePasswordData.oldPassword,
            ChangePasswordRequest.CodingKeys.newPassword.rawValue: changePasswordData.newPassword
        ]
        
        let body = try JSONSerialization.data(withJSONObject: parameters, options: [])
        
        let request = try makeHTTPRequest(method: .post,
                                          path: ReleaseURL.member.changePassword,
                                          headers: APIConstants.tokenHeaders,
                                          body: body)
        
        let (_, response) = try await URLSession.shared.data(for: request)
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw NetworkError.invalidResponse
        }
    }
    
    func postRegisterDeviceToken(deviceData: FCMTokenRequest) async throws {
        let parameters: [String: String] = [
            FCMTokenRequest.CodingKeys.uuid.rawValue: deviceData.uuid,
            FCMTokenRequest.CodingKeys.fcmToken.rawValue: deviceData.fcmToken
        ]
        
        let body = try JSONSerialization.data(withJSONObject: parameters, options: [])
        
        let request = try makeHTTPRequest(method: .post,
                                          path: ReleaseURL.member.registerDevice,
                                          headers: APIConstants.tokenHeaders,
                                          body: body)
        
        let (_, response) = try await URLSession.shared.data(for: request)
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw NetworkError.invalidResponse
        }
    }
}
