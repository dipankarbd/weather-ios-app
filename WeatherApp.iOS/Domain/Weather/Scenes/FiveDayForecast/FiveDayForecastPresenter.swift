//
//  FiveDayForecastPresenter.swift
//  WeatherApp.iOS
//
//  Created by Dipankar Biswas on 3/16/24.
//

import Foundation


protocol FiveDayForecastPresenterProtocol {
    func presentForecast(response: FiveDayForecast.LoadForecast.Response) async
}


class FiveDayForecastPresenter {
    var view: FiveDayForecastViewProtocol?
}

extension FiveDayForecastPresenter: FiveDayForecastPresenterProtocol {
    func presentForecast(response: FiveDayForecast.LoadForecast.Response) async {
        let viewModel = FiveDayForecast.LoadForecast.ViewModel(forecast: response.forecast)
        await view?.displayForecast(viewModel: viewModel)
    }
}

