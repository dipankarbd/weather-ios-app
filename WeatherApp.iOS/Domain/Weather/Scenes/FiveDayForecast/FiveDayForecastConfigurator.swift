//
//  FiveDayForecastConfigurator.swift
//  WeatherApp.iOS
//
//  Created by Dipankar Biswas on 3/16/24.
//


import SwiftUI

extension FiveDayForecastView {
    func configureView() -> some View {
        var view = self
        
        let httpClient = HTTPClient()
        let worker = WeatherNetworkWorker(httpClient: httpClient)
        let interactor = FiveDayForecastInteractor(worker: worker)
        let presenter = FiveDayForecastPresenter()
        
        view.interactor = interactor
        interactor.presenter = presenter
        presenter.view = view
        
        return view
    }
}



