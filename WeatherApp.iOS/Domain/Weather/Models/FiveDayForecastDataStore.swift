//
//  FiveDayForecastDataStore.swift
//  WeatherApp.iOS
//
//  Created by Dipankar Biswas on 3/10/24.
//

import Foundation

class FiveDayForecastDataStore: ObservableObject {
    @Published var forecasts: [DailyForecast] = []
}

#if DEBUG
extension FiveDayForecastDataStore {
    static var sample: FiveDayForecastDataStore {
        let model = FiveDayForecastDataStore()
        
        model.forecasts =  [
            DailyForecast(day: "Mon", date: "3/18", condition: "Clear", maxTemp: 8, minTemp: 3, wind: 7.9705954, icon: "sun.max"),
            DailyForecast(day: "Tue", date: "3/19", condition: "Clody", maxTemp: 22, minTemp: 17, wind: 45.93904, icon: "sun.rain"),
            DailyForecast(day: "Wed", date: "3/20", condition: "Haze", maxTemp: 45, minTemp: 41, wind: 49.5705, icon: "cloud.sun"),
            DailyForecast(day: "Thu", date: "3/21", condition: "Rain", maxTemp: 36, minTemp: 34, wind: 9.225952, icon: "sun.max"),
            DailyForecast(day: "Fri", date: "3/22", condition: "Clody", maxTemp: 44, minTemp: 41, wind: 39.91947, icon: "wind.snow")
        ]
        
        return model
    }
}
#endif

