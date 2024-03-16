//
//  CurrentWeatherInteractor.swift
//  WeatherApp.iOS
//
//  Created by Dipankar Biswas on 3/16/24.
//

import Foundation

protocol CurrentWeatherInteractorProtocol {
    func loadCurrentWeather(request: CurrentWeather.LoadWeather.Request) async
}

class CurrentWeatherInteractor {
    let worker: WeatherNetworkWorkerProtocol
    var presenter: CurrentWeatherPresenterProtocol?
    
    init(worker: WeatherNetworkWorkerProtocol) {
        self.worker = worker
    }
}


extension CurrentWeatherInteractor: CurrentWeatherInteractorProtocol {
    func loadCurrentWeather(request: CurrentWeather.LoadWeather.Request) async {
        
        do {
            let weather = try await worker.fetchCurrent(city: request.city)
            let forecasts = try await worker.fetchHourlyForecasts(city: request.city)
            
            let response = CurrentWeather.LoadWeather.Response(
                weather: weather,
                hourlyForecast: forecasts
            )
            
            await presenter?.presentCurrentWeather(response: response)
        } catch {
            print("Error occured: \(error.localizedDescription)")
            // TODO - present error
        }
    }
}
