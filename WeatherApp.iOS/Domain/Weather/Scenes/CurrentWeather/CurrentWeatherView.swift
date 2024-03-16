//
//  CurrentWeatherView.swift
//  WeatherApp.iOS
//
//  Created by Dipankar Biswas on 3/16/24.
//

import SwiftUI


struct CurrentWeatherView: View {
    @ObservedObject var data = CurrentWeatherDataStore()
    @State var city = "Dhaka"
    
    var body: some View {
        NavigationStack {
            ZStack {
                Rectangle()
                    .fill(.black.gradient)
                    .ignoresSafeArea()
                
                if let weather = data.weather {
                    TodaysWeatherView(weather: weather,
                                      hourlyForecasts: data.hourlyForecasts)
                } else {
                    LoadingView()
                }
            }
            .foregroundStyle(.white)
            .navigationDestination(for: String.self) { city in
                FiveDayForecastView(city: city)
            }
        }
    }
}

private struct LoadingView: View {
    var body: some View {
        VStack {
            Text("Loading...")
        }
    }
}

#Preview {
    CurrentWeatherView(data: CurrentWeatherDataStore.sample)
}
