//
//  FiveDayForecastView.swift
//  WeatherApp.iOS
//
//  Created by Dipankar Biswas on 3/14/24.
//

import SwiftUI

protocol FiveDayForecastViewProtocol {
    func displayForecast(viewModel: FiveDayForecast.LoadForecast.ViewModel) async
}

extension FiveDayForecastView: FiveDayForecastViewProtocol {
    func displayForecast(viewModel: FiveDayForecast.LoadForecast.ViewModel) async {
        data.forecasts = viewModel.forecast
    }
     
    func fetchForecast() async {
        let request = FiveDayForecast.LoadForecast.Request(city: city)
        await interactor?.loadForecast(request: request)
    }
}

  
@MainActor
struct FiveDayForecastView: View {
    let city: String
    
    var interactor: FiveDayForecastInteractorProtocol?
    @ObservedObject var data = FiveDayForecastDataStore()
    
    var body: some View {
        VStack {
            HStack {
                Text("5-day forecast")
                    .font(.largeTitle)
                Spacer()
            }.padding()
            
            HStack {
                ForEach(data.forecasts, id: \.date) { forecast in
                    DayItemView(forecast: forecast)
                }
            }.padding(.horizontal)
            Spacer()
        }.task {
            await fetchForecast()
        }
    }
}

private struct DayItemView: View {
    let forecast: DailyForecast
    
    var body: some View {
        let windSpeed = String(format: "%.2f", forecast.wind)
        
        VStack(spacing: 16) {
            Text(forecast.day)
                .font(.system(size: 10))
            Text(forecast.date)
            Image(systemName: forecast.icon)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 24)
            Text("\(forecast.maxTemp)° / \(forecast.minTemp)°")
            
            Text("\(windSpeed) km/h")
                .font(.system(size: 10))
        }
        .frame(maxWidth: 72)
        .padding()
        .background(Color(red: 0.0, green: 0.0, blue: 0.0, opacity: 0.1))
        .cornerRadius(8.0)
        .font(.system(size: 12))
        
    }
}

#Preview {
    FiveDayForecastView(city: "Dhaka",
                        data: FiveDayForecastDataStore.sample)
}
