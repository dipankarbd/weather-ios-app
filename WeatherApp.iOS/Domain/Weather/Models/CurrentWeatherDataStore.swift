//
//  CurrentWeatherDataStore.swift
//  WeatherApp.iOS
//
//  Created by Dipankar Biswas on 3/10/24.
//

import Foundation

class CurrentWeatherDataStore: ObservableObject {
    @Published var weather: TodaysWeather? = nil
    @Published var hourlyForecasts: [HourlyForecast] = []
}


#if DEBUG
extension CurrentWeatherDataStore {
    static var sample: CurrentWeatherDataStore {
        let model = CurrentWeatherDataStore()
        model.weather = TodaysWeather(city: "Dhaka",
                                      currentTemp: 26,
                                      maxTemp: 30,
                                      minTemp: 18,
                                      condition: "Clear",
                                      airQuality: 120,
                                      threeDayForecast: [
                                        DailyForecast(day: "Tue",
                                                      date: "3/19",
                                                      condition: "Snow",
                                                      maxTemp: 19,
                                                      minTemp: 14,
                                                      wind: 87.6866,
                                                      icon: "cloud.drizzle"),
                                        DailyForecast(day: "Wed",
                                                      date: "3/20",
                                                      condition: "Snow",
                                                      maxTemp: 27,
                                                      minTemp: 21,
                                                      wind: 61.391735,
                                                      icon: "cloud.drizzle"),
                                        DailyForecast(day: "Thu",
                                                      date: "3/21",
                                                      condition: "Rain",
                                                      maxTemp: 29,
                                                      minTemp: 27,
                                                      wind: 95.9596,
                                                      icon: "sun.dust")
                                      ]
        )
        
        model.hourlyForecasts = [
            
            HourlyForecast(
                temp: 46,
                hour: "06:00",
                wind: 3.1709194,
                icon: "cloud.drizzle"
            ),
            HourlyForecast(
                temp: 41,
                hour: "07:00",
                wind: 33.200012,
                icon: "sun.rain"
            ),
            
            HourlyForecast(
                temp: 34,
                hour: "08:00",
                wind: 46.25776,
                icon: "sun.rain"),
            
            HourlyForecast(
                temp: 28,
                hour: "09:00",
                wind: 79.50287,
                icon: "cloud.drizzle"),
            HourlyForecast(
                temp: 8,
                hour: "10:00",
                wind: 11.64763,
                icon: "cloud.sun"),
            
            HourlyForecast(
                temp: 38,
                hour: "11:00",
                wind: 81.70137,
                icon: "cloud.sun"),
            
            HourlyForecast(
                temp: 14,
                hour: "12:00",
                wind: 62.386894,
                icon: "sun.rain"),
            
            HourlyForecast(
                temp: 39,
                hour: "13:00",
                wind: 37.599373,
                icon: "sun.dust"),
            
            HourlyForecast(
                temp : 39,
                hour : "14:00",
                wind : 7.267952,
                icon : "sun.dust"),
            HourlyForecast(
                temp: 46,
                hour: "15:00",
                wind: 2.7435899,
                icon: "sun.rain"),
            
            HourlyForecast(
                temp : 46,
                hour : "16:00",
                wind : 38.179897,
                icon : "cloud.drizzle"),
            HourlyForecast(
                temp: 38,
                hour: "17:00",
                wind: 97.74302,
                icon: "sun.haze"),
            HourlyForecast(
                temp: 12,
                hour: "18:00",
                wind: 0.2669692,
                icon: "cloud.rain"),
            HourlyForecast(
                temp : 19,
                hour : "19:00",
                wind : 97.735405,
                icon : "cloud.drizzle"),
            HourlyForecast(
                temp: 34,
                hour: "20:00",
                wind: 10.330927,
                icon: "sun.dust"
            ),
            HourlyForecast(
                temp: 29,
                hour: "21:00",
                wind: 69.282364,
                icon: "cloud.rain"),
            HourlyForecast(
                
                temp: 31,
                hour: "22:00",
                wind: 95.19403,
                icon: "sun.rain"),
            HourlyForecast(
                temp: 37,
                hour: "23:00",
                wind: 32.90242,
                icon: "sun.max"),
            HourlyForecast(
                temp: 34,
                hour: "00:00",
                wind: 97.68314,
                icon: "sun.max"),
            
            HourlyForecast(
                temp: 31,
                hour: "01:00",
                wind: 9.633482,
                icon: "snowflake"),
            HourlyForecast(
                temp: 0,
                hour: "02:00",
                wind: 48.670876,
                icon: "sun.dust"),
            HourlyForecast(
                temp: 8,
                hour: "03:00",
                wind: 3.3644795,
                icon: "sun.dust"),
            HourlyForecast(
                temp: 12,
                hour: "04:00",
                wind: 42.04215,
                icon: "cloud.drizzle"),
            HourlyForecast(
                temp : 36,
                hour : "05:00",
                wind : 12.378311,
                icon : "cloud.rain")
        ]
        
        return model
    }
}
#endif

