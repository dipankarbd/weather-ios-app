//
//  FiveDayForecastInteractor.swift
//  WeatherApp.iOS
//
//  Created by Dipankar Biswas on 3/16/24.
//

import Foundation

protocol FiveDayForecastInteractorProtocol {
    func loadForecast(request: FiveDayForecast.LoadForecast.Request) async
}

class FiveDayForecastInteractor {
    let worker: WeatherNetworkWorkerProtocol
    var presenter: FiveDayForecastPresenterProtocol?
    
    init(worker: WeatherNetworkWorkerProtocol) {
        self.worker = worker
    }
}


extension FiveDayForecastInteractor: FiveDayForecastInteractorProtocol {
    func loadForecast(request: FiveDayForecast.LoadForecast.Request) async {
        do {
            let forecasts = try await worker.fetchFiveDayForecasts(city: request.city)
            let response = FiveDayForecast.LoadForecast.Response(forecast: forecasts)
            await presenter?.presentForecast(response: response)
        } catch {
            print("Error occured: \(error.localizedDescription)")
            // TODO - present error
        }
    }
}

