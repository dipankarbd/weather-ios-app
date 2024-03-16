//
//  WeatherApp_iOSApp.swift
//  WeatherApp.iOS
//
//  Created by Dipankar Biswas on 3/10/24.
//

import SwiftUI

@main
struct WeatherApp_iOSApp: App {
    var body: some Scene {
        WindowGroup {
            CurrentWeatherView().configureView()
        }
    }
}
