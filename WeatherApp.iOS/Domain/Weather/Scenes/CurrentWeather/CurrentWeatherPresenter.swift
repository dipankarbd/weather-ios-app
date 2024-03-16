//
//  CurrentWeatherPresenter.swift
//  WeatherApp.iOS
//
//  Created by Dipankar Biswas on 3/16/24.
//

import Foundation

protocol CurrentWeatherPresenterProtocol {
    func presentCurrentWeather(response: CurrentWeather.LoadWeather.Response) async
}


class CurrentWeatherPresenter {
    var view: CurrentWeatherViewProtocol?
}

extension CurrentWeatherPresenter: CurrentWeatherPresenterProtocol {
    func presentCurrentWeather(response: CurrentWeather.LoadWeather.Response) async {
        let viewModel = CurrentWeather.LoadWeather.ViewModel(
            weather: response.weather,
            hourlyForecast: response.hourlyForecast
        )
        
        await view?.displayCurrentWeather(viewModel: viewModel)
    }
}
