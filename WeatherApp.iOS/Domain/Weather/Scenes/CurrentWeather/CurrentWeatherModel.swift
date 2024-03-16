//
//  CurrentWeatherModel.swift
//  WeatherApp.iOS
//
//  Created by Dipankar Biswas on 3/16/24.
//

import Foundation

enum CurrentWeather {
    enum LoadWeather {
        struct Request {
            let city: String
        }
        
        struct Response {
            var weather: TodaysWeather
            var hourlyForecast: [HourlyForecast]
        }
        
        struct ViewModel {
            var weather: TodaysWeather
            var hourlyForecast: [HourlyForecast]
        }
    }
}

