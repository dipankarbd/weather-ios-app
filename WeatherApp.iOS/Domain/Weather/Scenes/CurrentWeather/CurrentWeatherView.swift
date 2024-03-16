//
//  CurrentWeatherView.swift
//  WeatherApp.iOS
//
//  Created by Dipankar Biswas on 3/16/24.
//


import SwiftUI


protocol CurrentWeatherViewProtocol {
    func displayCurrentWeather(viewModel: CurrentWeather.LoadWeather.ViewModel) async
}

extension CurrentWeatherView: CurrentWeatherViewProtocol {
    func displayCurrentWeather(viewModel: CurrentWeather.LoadWeather.ViewModel) async {
        data.weather = viewModel.weather
        data.hourlyForecasts = viewModel.hourlyForecast
    }
    
    func fetchWeather() async {
        let request = CurrentWeather.LoadWeather.Request(city: city)
        await interactor?.loadCurrentWeather(request: request)
    }
}

struct CurrentWeatherView: View {
    var interactor: CurrentWeatherInteractorProtocol?
    
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
                FiveDayForecastView(city: city).configureView()
            }
        }
        .task {
            await fetchWeather()
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
