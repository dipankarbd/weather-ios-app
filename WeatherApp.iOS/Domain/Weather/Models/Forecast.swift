//
//  Forecast.swift
//  WeatherApp.iOS
//
//  Created by Dipankar Biswas on 3/10/24.
//

import Foundation

struct DailyForecast: Decodable, Equatable {
    let day: String
    let date: String
    let condition: String
    let maxTemp: Int
    let minTemp: Int
    let wind: Double
    let icon: String
}

struct TodaysWeather: Decodable, Equatable {
    let city: String
    let currentTemp: Int
    let maxTemp: Int
    let minTemp: Int
    let condition: String
    let airQuality: Int
    let threeDayForecast: [DailyForecast]
    
}

struct HourlyForecast: Decodable, Equatable {
    let temp: Int
    let hour: String
    let wind: Double
    let icon: String
}
