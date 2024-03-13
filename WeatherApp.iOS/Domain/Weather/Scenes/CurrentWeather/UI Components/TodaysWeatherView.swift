//
//  TodaysWeatherView.swift
//  WeatherApp.iOS
//
//  Created by Dipankar Biswas on 3/13/24.
//

import SwiftUI


struct TodaysWeatherView: View {
    
    let weather: TodaysWeather
    let hourlyForecasts: [HourlyForecast]
    
    var body: some View {
        VStack {
            Text(weather.city)
                .font(.title)
                .padding()
            
            
            CurrentConditionView(weather: weather)
            
            Spacer()
            
            ThreeDayForecastView(city: weather.city, forecasts: weather.threeDayForecast)
                .padding()
            
            TwentyFourHourForecastView(forecasts: hourlyForecasts)
                .padding()
            
            Spacer()
        }
    }
}


private struct CurrentConditionView: View {
    let weather: TodaysWeather
    
    var body: some View {
        VStack {
            HStack  {
                Text("\(weather.currentTemp)")
                    .font(.system(size: 72))
                Text("°C")
                    .font(.system(size: 16))
                    .bold()
                    .baselineOffset(32.0)
            }
            Text("\(weather.condition) \(weather.maxTemp)°/\(weather.minTemp)°")
            Text("AQI \(weather.airQuality)")
                .font(.system(size: 12))
                .padding(EdgeInsets(top: 4, leading: 8, bottom: 4, trailing: 8))
                .background(Color(red: 1.0, green: 1.0, blue: 1.0, opacity: 0.2))
                .cornerRadius(12)
        }
    }
}



private struct ThreeDayForecastView: View {
    let city: String
    let forecasts: [DailyForecast]
    
    var body: some View {
        VStack {
            NavigationLink(value: city) {
                HStack {
                    Image(systemName: "calendar.circle.fill")
                    Text("5-day forecast")
                    Spacer()
                    HStack {
                        Text("More details")
                        Image(systemName: "chevron.right")
                    }.font(.system(size: 12))
                }
                .font(.system(size: 14))
                .opacity(0.75)
            }
            
            
            VStack {
                ForEach(forecasts, id: \.date) { forecast in
                    DayItemView(forecast: forecast)
                }
            }
            
            NavigationLink(value: city) {
                Text("5-day forecast")
                    .frame(maxWidth: .infinity)
                    .padding(8)
                    .background(Color(white: 0.2))
                    .cornerRadius(16)
                    .padding(4)
            }
        }
        .padding(8)
        .background(Color(red: 1.0, green: 1.0, blue: 1.0, opacity: 0.1))
        .cornerRadius(8)
    }
}

private struct DayItemView: View {
    let forecast: DailyForecast
    
    var body: some View {
        HStack {
            Image(systemName: forecast.icon)
            Text(forecast.day)
            Text(forecast.condition)
            Spacer()
            Text("\(forecast.maxTemp)° / \(forecast.minTemp)°")
        }
        .font(.system(size: 16))
        .padding(.vertical, 8)
    }
}

struct CurrentWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        TodaysWeatherView(weather: CurrentWeatherDataStore.sample.weather!,
                          hourlyForecasts: CurrentWeatherDataStore.sample.hourlyForecasts)
        .foregroundStyle(.white)
        .background(.black)
        .previewLayout(.sizeThatFits)
    }
}



