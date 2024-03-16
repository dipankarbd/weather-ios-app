//
//  WeatherNetworkWorkerStub.swift
//  WeatherApp.iOSTests
//
//  Created by Dipankar Biswas on 3/16/24.
//

import Foundation
@testable import WeatherApp_iOS

class WeatherNetworkWorkerStub: WeatherNetworkWorkerProtocol {
    func fetchCurrent(city: String) async throws -> WeatherApp_iOS.TodaysWeather {
        return CurrentWeatherDataStore.sample.weather!
    }
    
    func fetchHourlyForecasts(city: String) async throws -> [WeatherApp_iOS.HourlyForecast] {
        return CurrentWeatherDataStore.sample.hourlyForecasts
    }
    
    func fetchFiveDayForecasts(city: String) async throws -> [WeatherApp_iOS.DailyForecast] {
        return FiveDayForecastDataStore.sample.forecasts
    }
}

