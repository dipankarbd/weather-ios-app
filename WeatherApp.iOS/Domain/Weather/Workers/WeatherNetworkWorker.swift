//
//  WeatherNetworkWorker.swift
//  WeatherApp.iOS
//
//  Created by Dipankar Biswas on 3/11/24.
//

import Foundation


protocol WeatherNetworkWorkerProtocol {
    func fetchCurrent(city: String)  async throws -> TodaysWeather
    func fetchHourlyForecasts(city: String)  async throws -> [HourlyForecast]
    func fetchFiveDayForecasts(city: String)  async throws -> [DailyForecast]
}


enum ApiServiceError: Error  {
    case invalidUrl
    case invalidResponse
    case networkError
    case unknown
}

private struct HourlyForecastResponse: Decodable {
    let city: String
    let forecasts: [HourlyForecast]
}

private struct FiveDayForecastResponse: Decodable {
    let city: String
    let forecasts: [DailyForecast]
}


class WeatherNetworkWorker: WeatherNetworkWorkerProtocol {
    let baseApi =  "http://172.16.205.110:8080/api"
    
    private let httpClient: HTTPClientProtocol
    
    init(httpClient: HTTPClientProtocol) {
        self.httpClient = httpClient
    }
    
    func fetchCurrent(city: String)  async throws -> TodaysWeather {
        let urlStr = "\(baseApi)/current/\(city)"
        guard let url = URL(string: urlStr) else {
            throw ApiServiceError.invalidUrl
        }
        
        do {
            let (statusCode, data) = try await httpClient.sendGetHTTPRequest(url: url, headers: nil, data: nil)
            
            if statusCode == 200 {
                let weather: TodaysWeather = try data.decode()
                return weather
            } else {
                throw ApiServiceError.invalidResponse
            }
        } catch DataError.decodingError {
            throw ApiServiceError.invalidResponse
        } catch {
            throw ApiServiceError.networkError
        }
    }
    
    func fetchHourlyForecasts(city: String)  async throws -> [HourlyForecast] {
        let urlStr = "\(baseApi)/forecast/twentyfourhours/\(city)"
        guard let url = URL(string: urlStr) else {
            throw ApiServiceError.invalidUrl
        }
        
        do {
            let (statusCode, data) = try await httpClient.sendGetHTTPRequest(url: url, headers: nil, data: nil)
            
            if statusCode == 200 {
                let resp: HourlyForecastResponse = try data.decode()
                return resp.forecasts
            } else {
                throw ApiServiceError.invalidResponse
            }
        } catch DataError.decodingError {
            throw ApiServiceError.invalidResponse
        } catch {
            throw ApiServiceError.networkError
        }
    }
    
    
    func fetchFiveDayForecasts(city: String)  async throws -> [DailyForecast] {
        let urlStr = "\(baseApi)/forecast/fivedays/\(city)"
        guard let url = URL(string: urlStr) else {
            throw ApiServiceError.invalidUrl
        }
        
        do {
            let (statusCode, data) = try await httpClient.sendGetHTTPRequest(url: url, headers: nil, data: nil)
            
            if statusCode == 200 {
                let resp: FiveDayForecastResponse = try data.decode()
                return resp.forecasts
            } else {
                throw ApiServiceError.invalidResponse
            }
        } catch DataError.decodingError {
            throw ApiServiceError.invalidResponse
        } catch {
            throw ApiServiceError.networkError
        }
    }
}
