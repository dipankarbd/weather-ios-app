//
//  HTTPClient.swift
//  WeatherApp.iOS
//
//  Created by Dipankar Biswas on 3/11/24.
//

import Foundation

protocol HTTPClientProtocol {
    func sendGetHTTPRequest(url: URL, headers: [String : String]?, data: Data?) async throws -> (Int, Data)
}

struct InvalidHTTPResponseError: Error { }

struct HTTPClient: HTTPClientProtocol {
    
    func sendGetHTTPRequest(url: URL, headers: [String : String]?, data: Data?) async throws -> (Int, Data) {
        var request = URLRequest(url: url)
        
        request.httpMethod = "GET"
        
        if let headers = headers {
            for (key, val) in headers {
                request.setValue(val, forHTTPHeaderField: key)
            }
        }
        
        request.httpBody = data
        
        let (data, response) = try await URLSession.shared.data(from: url)
        if let response = response as? HTTPURLResponse {
            return (response.statusCode, data)
        } else {
            throw InvalidHTTPResponseError()
        }
    }
    
}
