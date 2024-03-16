//
//  CurrentWeatherConfigurator.swift
//  WeatherApp.iOS
//
//  Created by Dipankar Biswas on 3/16/24.
//

import SwiftUI

extension CurrentWeatherView {
    func configureView() -> some View {
        var view = self
        
        let httpClient = HTTPClient()
        let worker = WeatherNetworkWorker(httpClient: httpClient)
        let interactor = CurrentWeatherInteractor(worker: worker)
        let presenter = CurrentWeatherPresenter()
        
        view.interactor = interactor
        interactor.presenter = presenter
        presenter.view = view
        
        return view
    }
}

