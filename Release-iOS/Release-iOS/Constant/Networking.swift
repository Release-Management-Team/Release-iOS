//
//  Networking.swift
//  Release-iOS
//
//  Created by 신지원 on 2/14/25.
//

import Foundation

protocol Networking {
    func makeHTTPRequest(
        method: HTTPMethod,
        baseURL: String,
        path: String,
        queryItems: [URLQueryItem]?,
        headers: [String: String],
        body: Data?) throws -> URLRequest
}

extension Networking {
    func makeHTTPRequest(
        method: HTTPMethod,
        baseURL: String = Config.baseURL,
        path: String,
        queryItems: [URLQueryItem]? = nil,
        headers: [String: String] = APIConstants.noTokenHeaders,
        body: Data? = nil
    ) throws -> URLRequest {
        
        /// URL => 전체 URL 을 표현
        /// URLComponents => URL 을 구성하는 요소를 분리하는 객체
        guard var urlComponents = URLComponents(string: baseURL + path)else {
            throw NetworkError.invalidURLComponent
        }
        
        /// queryItems 를 먼저 설정한 후 url 을 가져와야 query 반영 가능
        urlComponents.queryItems = queryItems
        guard let url = urlComponents.url else {
            throw NetworkError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        headers.forEach({ header in
            request.addValue(header.value, forHTTPHeaderField: header.key)
        })
        
        if let body = body {
            request.httpBody = body
        }
        
        return request
    }
}
