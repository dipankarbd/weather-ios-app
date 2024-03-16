//
//  FiveDayForecastModel.swift
//  WeatherApp.iOS
//
//  Created by Dipankar Biswas on 3/16/24.
//

import Foundation


enum FiveDayForecast {
    enum LoadForecast {
        struct Request {
            let city: String
        }
        
        struct Response {
            var forecast: [DailyForecast]
        }
        
        struct ViewModel {
            var forecast: [DailyForecast]
        }
    }
}
